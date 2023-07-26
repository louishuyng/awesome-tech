const app = require("express")();

app.get("/", (_, res) => {
  res.send("Hello World!");
});

app.get("/stream", (_, res) => {
  res.setHeader("Content-Type", "text/event-stream");

  send(res);
});

const port = process.env.PORT || 8000;

let i = 0;
function send(res) {
  res.write(`data: Stream Event From Server ${i++}\n\n`);

  setTimeout(() => send(res), 1000);
}

app.listen(port);

console.log(`Server listening on port ${port}`);
