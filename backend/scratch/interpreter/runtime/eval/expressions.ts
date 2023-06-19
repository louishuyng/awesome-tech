import {
  RuntimeVal,
  NumberVal,
  MK_NULL,
  ObjectVal,
  NativeFnValue,
  FunctionValue,
} from "../values.ts";
import Environment from "../environment.ts";
import {
  AssigmentExpr,
  BinaryExpr,
  CallExpr,
  Identifier,
  ObjectLiteral,
} from "../../frontend/ast.ts";
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

export function evalObjectExpr(
  obj: ObjectLiteral,
  env: Environment
): RuntimeVal {
  const object = { type: "object", properties: new Map() } as ObjectVal;

  for (const { key, value } of obj.properties) {
    const runtimeVal =
      value === undefined ? env.lookupVar(key) : evaluate(value, env);

    object.properties.set(key, runtimeVal);
  }

  return object;
}

export function evalCallExpr(expr: CallExpr, env: Environment): RuntimeVal {
  const args = expr.args.map((arg) => evaluate(arg, env));
  const fn = evaluate(expr.caller, env);

  if (fn.type === "native-fn") {
    const result = (fn as NativeFnValue).call(args, env);
    return result;
  }

  if (fn.type === "function") {
    const func = fn as FunctionValue;
    const scope = new Environment(func.declarationEnv);

    // Create the variables for the parameters list
    for (let i = 0; i < func.parameters.length; i++) {
      // TODO: Check the bounds here.
      // verify arity of function
      const varname = func.parameters[i];
      scope.declareVar(varname, args[i], false);
    }

    let result: RuntimeVal = MK_NULL();
    for (const stmt of func.body) {
      result = evaluate(stmt, scope);
    }

    return result;
  }

  throw "Cannot call value that is not a function: " + JSON.stringify(fn);
}
