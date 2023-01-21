import { createTRPCReact } from "@trpc/react-query";
import type { AppRouter } from "../../../../backend/trpc/src/routers";

export const trpc = createTRPCReact<AppRouter>();
