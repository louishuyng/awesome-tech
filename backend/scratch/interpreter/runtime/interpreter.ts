import { ValueType, RuntimeVal, NumberVal, MK_NULL } from "./values.ts";
import Environment from "./environment.ts";
import {
  BinaryExpr,
  Identifier,
  NodeType,
  NumericLiteral,
  Program,
  Stmt,
} from "../frontend/ast.ts";

function evalProgram(program: Program, env: Environment): RuntimeVal {
  let lastEvaluated: RuntimeVal = MK_NULL();

  for (const stmt of program.body) {
    lastEvaluated = evaluate(stmt, env);
  }

  return lastEvaluated;
}

function evalNumericBinaryExpr(
  lhs: NumberVal,
  rhs: NumberVal,
  operator: string
): NumberVal {
  let result: number;

  if (operator === "+") {
    result = lhs.value + rhs.value;
  } else if (operator === "-") {
    result = lhs.value - rhs.value;
  } else if (operator === "*") {
    result = lhs.value * rhs.value;
  } else if (operator === "/") {
    // TODO: Division by zero checks
    result = lhs.value / rhs.value;
  } else {
    result = lhs.value % rhs.value;
  }

  return {
    type: "number",
    value: result,
  };
}

function evaluateBinaryExpr(binop: BinaryExpr, env: Environment): RuntimeVal {
  const lhs = evaluate(binop.left, env);
  const rhs = evaluate(binop.right, env);

  if (lhs.type == "number" && rhs.type == "number") {
    return evalNumericBinaryExpr(
      lhs as NumberlVal,
      rhs as NumberlVal,
      binop.operator
    );
  }

  // One or both are NULL
  return MK_NULL();
}

function evalIdentifier(ident: Identifier, env: Environment): RuntimeVal {
  const val = env.lookupVar(ident.symbol);
  return val;
}

export function evaluate(astNode: Stmt, env: Environment): RuntimeVal {
  switch (astNode.kind) {
    case "NumericLiteral":
      return {
        value: (astNode as NumericLiteral).value,
        type: "number",
      } as NumberVal;
    case "Identifier":
      return evalIdentifier(astNode as Identifier, env);
    case "BinaryExpr":
      return evaluateBinaryExpr(astNode as BinaryExpr, env);
    case "Program":
      return evalProgram(astNode as Program, env);
    default:
      console.error(
        "This AST Node has not yet been setup interpretation",
        astNode
      );
      Deno.exit(0);
  }
}
