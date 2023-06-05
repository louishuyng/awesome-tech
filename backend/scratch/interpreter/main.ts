import Parser from "./frontend/parser.ts";
import { evaluate } from "./runtime/interpreter.ts";

repl();

async function repl() {
  const parser = new Parser();
  console.log("\nRepl v0.1");

  while (true) {
    const input = prompt("> ");

    // Check for no user input or exit keyword
    if (!input || input.includes("exit")) {
      Deno.exit(1);
    }

    const program = parser.produceAST(input);

    const result = evaluate(program);
    console.log(result);
  }
}
