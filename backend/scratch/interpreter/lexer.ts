export enum TokenType {
  Number,
  Identifier,
  Equals,
  OpenParen,
  CloseParen,
  BinaryOperator,
  Let,
}

const KEYWORDS: Record<string, TokenType> = {
  let: TokenType.Let,
};

export interface Token {
  value: string;
  type: TokenType;
}

function token(value = "", type: TokenType): Token {
  return {
    value,
    type,
  };
}

function isAlpha(src: string): boolean {
  return src.toUpperCase() != src.toLowerCase();
}

function isInt(src: string): boolean {
  const c = src.charCodeAt(0);
  const bounds = ["0".charCodeAt(0), "9".charCodeAt(0)];

  return c >= bounds[0] && c <= bounds[1];
}

function isSkipable(src: string): boolean {
  return src === " " || src === "\n" || src === "\t";
}

export function tokenize(sourceCode: string): Token[] {
  const tokens = new Array<Token>();
  const src = sourceCode.split("");

  // Build each token until end of file
  while (src.length > 0) {
    if (src[0] === "(") {
      tokens.push(token(src.shift(), TokenType.OpenParen));
    }

    if (src[0] === ")") {
      tokens.push(token(src.shift(), TokenType.CloseParen));
    }

    if (src[0] === "+" || src[0] == "-" || src[0] === "*" || src[0] === "/") {
      tokens.push(token(src.shift(), TokenType.BinaryOperator));
    }

    if (src[0] === "=") {
      tokens.push(token(src.shift(), TokenType.Equals));
    }

    // Build number token
    if (isInt(src[0])) {
      let num = "";
      while (src.length > 0 && isInt(src[0])) {
        num += src.shift();
      }

      tokens.push(token(num, TokenType.Number));
    }

    // Build identifier token
    if (isAlpha(src[0])) {
      let ident = "";

      while (src.length > 0 && isAlpha(src[0])) {
        ident += src.shift();
      }

      // check for reserved keywords
      const reserved = KEYWORDS[ident];

      if (reserved === undefined) {
        tokens.push(token(ident, TokenType.Identifier));
      } else {
        tokens.push(token(ident, reserved));
      }
      continue;
    }

    if (isSkipable(src[0])) {
      src.shift();
    } else {
      console.log(`Unrecognized character found in source: ${src[0]}`);
      Deno.exit(1);
    }
  }

  return tokens;
}

const source = await Deno.readTextFile("./test.txt");

for (const token of tokenize(source)) {
  console.log(token);
}
