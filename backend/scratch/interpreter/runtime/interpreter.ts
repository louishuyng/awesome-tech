import { RuntimeVal, NumberVal } from "./values.ts";
import Environment from "./environment.ts";
import {
  BinaryExpr,
  Identifier,
  NodeType,
  NumericLiteral,
  Program,
  Stmt,
} from "../frontend/ast.ts";
import { evalProgram, evalVarDeclaration } from "./eval/statements.ts";
import { evalIdentifier, evaluateBinaryExpr } from "./eval/expressions.ts";

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

    //Handle Statements
    case "VarDeclaration":
      return evalVarDeclaration(astNode as VarDeclaration, env);
    default:
      console.error(
        "This AST Node has not yet been setup interpretation",
        astNode
      );
      Deno.exit(0);
  }
}
