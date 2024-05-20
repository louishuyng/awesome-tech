import {
  TextDocumentContentChangeEvent,
  VersionedTextDocumentIdentifier,
  documents,
} from "../../documents";
import { NotificationMessage } from "../../server";

interface DidChangeTextDocumentParams {
  textDocument: VersionedTextDocumentIdentifier;
  contentChanges: TextDocumentContentChangeEvent[];
}

export const didChange = (message: NotificationMessage): void => {
  const params = message.params as DidChangeTextDocumentParams;

  documents.set(params.textDocument.uri, params.contentChanges[0].text);
};
