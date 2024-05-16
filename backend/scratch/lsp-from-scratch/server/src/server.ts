import log from "./log";

process.stdin.on("data", (chunk) => {
  log.write(chunk.toString());
});
