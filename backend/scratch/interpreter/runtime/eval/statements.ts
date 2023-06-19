import { RuntimeVal, MK_NULL, FunctionValue } from "../values.ts";
import Environment from "../environment.ts";
import {
  FunctionDeclaration,
  Program,
  VarDeclaration,
} from "../../frontend/ast.ts";
import { evaluate } from "../interpreter.ts";

export function evalProgram(program: Program, env: Environment): RuntimeVal {
  let lastEvaluated: RuntimeVal = MK_NULL();

  for (const stmt of program.body) {
    lastEvaluated = evaluate(stmt, env);
  }

  return lastEvaluated;
}

export function evalVarDeclaration(
  declaration: VarDeclaration,
  env: Environment
): RuntimeVal {
  const value = declaration.value
    ? evaluate(declaration.value, env)
    : MK_NULL();

  return env.declareVar(declaration.identifier, value, declaration.constant);
}

export function evalFunctionDeclaration(
  declaration: FunctionDeclaration,
  env: Environment
): RuntimeVal {
  const fn = {
    type: "function",
    name: declaration.name,
    parameters: declaration.parameters,
    declarationEnv: env,
    body: declaration.body,
  } as FunctionValue;

  return env.declareVar(declaration.name, fn, true);
}
