import { RuntimeVal, NumberVal, MK_NULL } from "../values.ts";
import Environment from "../environment.ts";
import { AssigmentExpr, BinaryExpr, Identifier } from "../../frontend/ast.ts";
import { evaluate } from "../interpreter.ts";

export function evalNumericBinaryExpr(
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

export function evaluateBinaryExpr(
  binop: BinaryExpr,
  env: Environment
): RuntimeVal {
  const lhs = evaluate(binop.left, env);
  const rhs = evaluate(binop.right, env);

  if (lhs.type == "number" && rhs.type == "number") {
    return evalNumericBinaryExpr(
      lhs as NumberVal,
      rhs as NumberVal,
      binop.operator
    );
  }

  // One or both are NULL
  return MK_NULL();
}

export function evalIdentifier(
  ident: Identifier,
  env: Environment
): RuntimeVal {
  const val = env.lookupVar(ident.symbol);
  return val;
}

export function evalAssignment(
  node: AssigmentExpr,
  env: Environment
): RuntimeVal {
  if (node.assigne.kind !== "Identifier") {
    throw `Invalid LHS inaide assignment expr ${JSON.stringify(node.assigne)}`;
  }

  const varname = (node.assigne as Identifier).symbol;

  return env.assignVar(varname, evaluate(node.value, env));
}