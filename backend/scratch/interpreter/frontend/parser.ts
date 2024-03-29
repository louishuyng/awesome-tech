import {
  Stmt,
  Program,
  Expr,
  BinaryExpr,
  NumericLiteral,
  Identifier,
  VarDeclaration,
  AssigmentExpr,
  Property,
  ObjectLiteral,
  CallExpr,
  MemberExpr,
  FunctionDeclaration,
} from "./ast.ts";
import { tokenize, Token, TokenType } from "./lexer.ts";
export default class Parser {
  private tokens: Token[] = [];

  private notEof(): boolean {
    return this.tokens[0].type !== TokenType.EOF;
  }

  private at(): Token {
    return this.tokens[0] as Token;
  }

  private eat(): Token {
    const prev = this.tokens.shift() as Token;
    return prev;
  }

  private expect(type: TokenType, err: any) {
    const prev = this.tokens.shift() as Token;
    if (!prev || prev.type !== type) {
      console.error("Parser Error:\n", err, prev, "Expecting:", type);
      Deno.exit(1);
    }

    return prev;
  }

  public produceAST(sourceCode: string): Program {
    console.log(sourceCode);
    this.tokens = tokenize(sourceCode);

    const program: Program = {
      kind: "Program",
      body: [],
    };

    // Parse until end of the file
    while (this.notEof()) {
      program.body.push(this.parseStmt());
    }

    return program;
  }

  private parseStmt(): Stmt {
    // skip to parse_expr
    switch (this.at().type) {
      case TokenType.Let:
      case TokenType.Const:
        return this.parseVarDeclaration();
      case TokenType.Fn:
        return this.parseFunctionDeclaration();
      default:
        return this.parseExpr();
    }
  }

  private parseFunctionDeclaration(): Stmt {
    this.eat(); // eat fn keyword

    const name = this.expect(
      TokenType.Identifier,
      "Expected function name following fn keyword"
    ).value;

    const args = this.parseArgs();
    const parameters: string[] = [];

    for (const arg of args) {
      if (arg.kind !== "Identifier") {
        console.log(arg);
        throw "Inside function declaration expected parameters to be of type string.";
      }

      parameters.push((arg as Identifier).symbol);
    }

    this.expect(
      TokenType.OpenBrace,
      "Expected function body following declaration"
    );

    const body: Stmt[] = [];

    while (
      this.at().type !== TokenType.EOF &&
      this.at().type !== TokenType.CloseBrace
    ) {
      body.push(this.parseStmt());
    }

    this.expect(
      TokenType.CloseBrace,
      "Closing brace expected inside function declaration"
    );

    const fn = {
      body,
      name,
      parameters,
      kind: "FunctionDeclaration",
    } as FunctionDeclaration;

    return fn;
  }

  // LET IDENTIFIER;
  // (LET | CONST) IDENTIFIER = EXPR;
  private parseVarDeclaration(): Stmt {
    const isConstant = this.eat().type === TokenType.Const;
    const identifier = this.expect(
      TokenType.Identifier,
      "Expected identifier name following let | const keywords."
    ).value;

    if (this.at().type === TokenType.Semicolon) {
      this.eat(); // expect semicolon
      if (isConstant) {
        throw "Must assign value to constant expression. No value provided.";
      }

      return {
        kind: "VarDeclaration",
        identifier,
        constant: false,
      } as VarDeclaration;
    }

    this.expect(
      TokenType.Equals,
      "Expected equals token following identifier in var declaration."
    );

    const declaration = {
      kind: "VarDeclaration",
      value: this.parseExpr(),
      identifier,
      constant: isConstant,
    } as VarDeclaration;

    this.expect(
      TokenType.Semicolon,
      "Variable declaration statement must end with semicolon."
    );
    return declaration;
  }

  private parseExpr(): Expr {
    return this.parseAssigmentExpr();
  }

  private parseAssigmentExpr(): Expr {
    const left = this.parseObjectExpr();

    if (this.at().type === TokenType.Equals) {
      this.eat();
      const value = this.parseAssigmentExpr();

      return { value, assigne: left, kind: "AssigmentExpr" } as AssigmentExpr;
    }

    return left;
  }

  private parseObjectExpr(): Expr {
    if (this.at().type !== TokenType.OpenBrace) {
      return this.parseAdditiveExpr();
    }

    this.eat(); // advance past open brace
    const properties = new Array<Property>();

    while (this.notEof() && this.at().type !== TokenType.CloseBrace) {
      // {key: val, key2: val}
      const key = this.expect(
        TokenType.Identifier,
        "Object literal key expected"
      ).value;

      // Allows shorthand key: pair -> {key,}
      if (this.at().type === TokenType.Comma) {
        this.eat(); //advance past comma
        properties.push({
          key,
          kind: "Property",
          value: undefined,
        });
        continue;
      } // Allows shorthand key: pair -> {key}
      else if (this.at().type === TokenType.CloseBrace) {
        properties.push({ key, kind: "Property" });
        continue;
      }

      // {key: val}
      this.expect(
        TokenType.Colon,
        "Missing colon following identifier in ObjectExpr"
      );
      const value = this.parseExpr();

      properties.push({ kind: "Property", key, value });

      if (this.at().type !== TokenType.CloseBrace) {
        this.expect(
          TokenType.Comma,
          "Expected comma or Closing Bracket following property"
        );
      }
    }

    this.expect(TokenType.CloseBrace, "Object literal missing closing brace.");

    return { kind: "ObjectLiteral", properties } as ObjectLiteral;
  }

  // (10 + 5) - 5
  private parseAdditiveExpr(): Expr {
    let left = this.parseMultiplicitaveExpr();

    while (this.at().value === "+" || this.at().value === "-") {
      const operator = this.eat().value;
      const right = this.parseMultiplicitaveExpr();
      left = {
        kind: "BinaryExpr",
        operator,
        left,
        right,
      } as BinaryExpr;
    }

    return left;
  }

  private parseMultiplicitaveExpr(): Expr {
    let left = this.parseCallMemberExpr();

    while (
      this.at().value === "*" ||
      this.at().value === "/" ||
      this.at().value === "%"
    ) {
      const operator = this.eat().value;
      const right = this.parseCallMemberExpr();
      left = {
        kind: "BinaryExpr",
        operator,
        left,
        right,
      } as BinaryExpr;
    }

    return left;
  }

  private parseCallMemberExpr(): Expr {
    const member = this.parseMemberExpr();

    if (this.at().type === TokenType.OpenParen) {
      return this.parseCallExpr(member);
    }

    return member;
  }

  private parseCallExpr(caller: Expr): Expr {
    let callExpr: Expr = {
      kind: "CallExpr",
      caller,
      args: this.parseArgs(),
    } as CallExpr;

    if (this.at().type === TokenType.OpenParen) {
      callExpr = this.parseCallExpr(callExpr);
    }

    return callExpr;
  }

  private parseArgs(): Expr[] {
    this.expect(TokenType.OpenParen, "Expected open parenthesis");
    const args =
      this.at().type === TokenType.CloseParen ? [] : this.parseArgumentsList();

    this.expect(
      TokenType.CloseParen,
      "Missing closing parenthesis inside arguments list."
    );

    return args;
  }

  private parseArgumentsList(): Expr[] {
    const args = [this.parseAssigmentExpr()];

    while (this.at().type === TokenType.Comma && this.eat()) {
      args.push(this.parseAssigmentExpr());
    }

    return args;
  }

  private parseMemberExpr(): Expr {
    let object = this.parsePrimaryExpr();

    while (
      this.at().type === TokenType.Dot ||
      this.at().type === TokenType.OpenBracket
    ) {
      const operator = this.eat();
      let property: Expr;
      let computed: boolean;

      // non-computed values aka obj.expr
      if (operator.type === TokenType.Dot) {
        computed = false;
        // get identifier
        property = this.parsePrimaryExpr();
        if (property.kind !== "Identifier") {
          throw `Cannot use dot operator without right hand side being a identifier`;
        }
      } else {
        // this allows obj[computedValue]
        computed = true;
        property = this.parseExpr();

        this.expect(
          TokenType.CloseBracket,
          "Missing closing bracket in computed value."
        );
      }

      object = {
        kind: "MemberExpr",
        object,
        property,
        computed,
      } as MemberExpr;
    }

    return object;
  }

  // Orders Of Prescidense
  // Assignment
  // Object
  // AdditiveExpr
  // MultiplicativeExpr
  // Call
  // Member
  // PrimaryExpr

  private parsePrimaryExpr(): Expr {
    const tk = this.at().type;

    switch (tk) {
      case TokenType.Identifier:
        return { kind: "Identifier", symbol: this.eat().value } as Identifier;
      case TokenType.Number:
        return {
          kind: "NumericLiteral",
          value: parseFloat(this.eat().value),
        } as NumericLiteral;
      case TokenType.OpenParen:
        this.eat(); // eat the open paren
        const value = this.parseExpr();
        this.expect(
          TokenType.CloseParen,
          "Expected closing paren after expression!"
        ); // eat the close paren
        return value;

      default:
        console.error("Unexpected token found ruing parsing!", this.at());
        Deno.exit(1);
    }
  }
}
