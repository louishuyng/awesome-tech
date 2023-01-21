import { router } from "../trpc";
import { noteRouter } from "./note.router";

const appRouter = router({
  note: noteRouter
});

// Export type router type signature,
// NOT the router itself.
export type AppRouter = typeof appRouter;

export { appRouter }
