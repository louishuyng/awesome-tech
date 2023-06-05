import { ValueType, RuntimeVal, NullVal, NumberVal } from "./values.ts";
import {
  BinaryExpr,
  NodeType,
  NumericLiteral,
  Program,
  Stmt,
} from "../frontend/ast.ts";

function evalProgram(program: Program): RuntimeVal {
  let lastEvaluated: RuntimeVal = { type: "null", value: "null" } as NullVal;

  for (const stmt of program.body) {
    lastEvaluated = evaluate(stmt);
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

function evaluateBinaryExpr(binop: BinaryExpr): RuntimeVal {
  const lhs = evaluate(binop.left);
  const rhs = evaluate(binop.right);

  if (lhs.type == "number" && rhs.type == "number") {
    return evalNumericBinaryExpr(
      lhs as NumberlVal,
      rhs as NumberlVal,
      binop.operator
    );
  }

  // One or both are NULL
  return { type: "null", value: "null" } as NullVal;
}

export function evaluate(astNode: Stmt): RuntimeVal {
  switch (astNode.kind) {
    case "NumericLiteral":
      return {
        value: (astNode as NumericLiteral).value,
        type: "number",
      } as NumberVal;
    case "NullLiteral":
      return {
        value: "null",
        type: "null",
      } as NullVal;
    case "BinaryExpr":
      return evaluateBinaryExpr(astNode as BinaryExpr);
    case "Program":
      return evalProgram(astNode as Program);
    default:
      console.error(
        "This AST Node has not yet been setup interpretation",
        astNode
      );
      Deno.exit(0);
  }
}
