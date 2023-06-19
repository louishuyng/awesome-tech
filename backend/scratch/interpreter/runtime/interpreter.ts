import { RuntimeVal, NumberVal } from "./values.ts";
import Environment from "./environment.ts";
import {
  AssigmentExpr,
  BinaryExpr,
  CallExpr,
  FunctionDeclaration,
  Identifier,
  NumericLiteral,
  ObjectLiteral,
  Program,
  Stmt,
  VarDeclaration,
} from "../frontend/ast.ts";
import {
  evalFunctionDeclaration,
  evalProgram,
  evalVarDeclaration,
} from "./eval/statements.ts";
import {
  evalAssignment,
  evalCallExpr,
  evalIdentifier,
  evalObjectExpr,
  evaluateBinaryExpr,
} from "./eval/expressions.ts";

export function evaluate(astNode: Stmt, env: Environment): RuntimeVal {
  switch (astNode.kind) {
    case "NumericLiteral":
      return {
        value: (astNode as NumericLiteral).value,
        type: "number",
      } as NumberVal;
    case "Identifier":
      return evalIdentifier(astNode as Identifier, env);
    case "ObjectLiteral":
      return evalObjectExpr(astNode as ObjectLiteral, env);
    case "CallExpr":
      return evalCallExpr(astNode as CallExpr, env);
    case "AssigmentExpr":
      return evalAssignment(astNode as AssigmentExpr, env);
    case "BinaryExpr":
      return evaluateBinaryExpr(astNode as BinaryExpr, env);
    case "Program":
      return evalProgram(astNode as Program, env);

    //Handle Statements
    case "VarDeclaration":
      return evalVarDeclaration(astNode as VarDeclaration, env);
    case "FunctionDeclaration":
      return evalFunctionDeclaration(astNode as FunctionDeclaration, env);
    default:
      console.error(
        "This AST Node has not yet been setup interpretation. \n",
        astNode
      );
      Deno.exit(0);
  }
}
