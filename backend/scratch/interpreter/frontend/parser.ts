import {
  Stmt,
  Program,
  Expr,
  BinaryExpr,
  NumericLiteral,
  Identifier,
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
    return this.parseExpr();
  }

  private parseExpr(): Expr {
    return this.parseAdditiveExpr();
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
