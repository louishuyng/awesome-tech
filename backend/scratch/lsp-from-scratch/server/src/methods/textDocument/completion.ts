import { documents, TextDocumentIdentifier } from "../../documents";
import { RequestMessage } from "../../server";
import * as fs from "fs";
import { Position } from "../../types";

const MAX_LENGTH = 1000;

const words = fs
  .readFileSync("/usr/share/dict/words", "utf-8")
  .toString()
  .split("\n");

interface CompletionItem {
  label: string;
}

interface CompletionList {
  isIncomplete: boolean;
  items: CompletionItem[];
}


interface TextDocumentPositionParams {
  textDocument: TextDocumentIdentifier;
  position: Position;
}

interface CompletionParams extends TextDocumentPositionParams {}

export const completion = (message: RequestMessage): CompletionList | null => {
  const params = message.params as CompletionParams;

  const content = documents.get(params.textDocument.uri);

  if (!content) {
    return null;
  }

  const currentLine = content.split("\n")[params.position.line];
  const lineUntilCursor = currentLine.slice(0, params.position.character);
  const currentPrefix = lineUntilCursor.replace(/.*\W(.*?)/, "$1");

  const items = words
    .filter((word) => word.startsWith(currentPrefix))
    .slice(0, MAX_LENGTH)
    .map((word) => ({ label: word }));

  return {
    isIncomplete: items.length === MAX_LENGTH,
    items,
  };
};
