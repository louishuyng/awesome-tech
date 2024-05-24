import { RequestMessage } from "../../server";
import { Range } from "../../types";

namespace DiagnosticSeverity {
  export const Error = 1;
  export const Warning = 2;
  export const Information = 3;
  export const Hint = 4;
}

type DiagnosticSeverity = 1 | 2 | 3 | 4;

interface Diagnostic {
  range: Range;
  severity: DiagnosticSeverity;
  source?: "LSP From Scratch";
  message: string;
  data?: unknown;
}
interface FullDocumentDiagnosticReport {
  kind: "full";
  items: Diagnostic[];
}

export const diagnostic = (
  message: RequestMessage
): FullDocumentDiagnosticReport => {
  return {
    kind: "full",
    items: [
      {
        range: {
          start: { line: 0, character: 4 },
          end: { line: 0, character: 8 },
        },
        severity: DiagnosticSeverity.Error,
        message: "This is an error",
        source: "LSP From Scratch",
      },
      {
        range: {
          start: { line: 1, character: 4 },
          end: { line: 1, character: 8 },
        },
        severity: DiagnosticSeverity.Warning,
        message: "This is an warning",
        source: "LSP From Scratch",
      },
    ],
  };
};
