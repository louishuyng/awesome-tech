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
      default:
        return this.parseExpr();
    }
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
    let left = this.parsePrimaryExpr();

    while (
      this.at().value === "*" ||
      this.at().value === "/" ||
      this.at().value === "%"
    ) {
      const operator = this.eat().value;
      const right = this.parsePrimaryExpr();
      left = {
        kind: "BinaryExpr",
        operator,
        left,
        right,
      } as BinaryExpr;
    }

    return left;
  }

  // Orders Of Prescidense
  // AdditiveExpr
  // MultiplicativeExpr
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
