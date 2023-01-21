export type Note = {
  id: number;
  name: string;
  state: string;
  priority: Priority;
};

export type Priority = "high" | "medium" | "low" | "none";
