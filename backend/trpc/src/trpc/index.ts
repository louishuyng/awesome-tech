import { inferAsyncReturnType, initTRPC } from '@trpc/server';
import * as trpcExpress from '@trpc/server/adapters/express';

const t = initTRPC.context<Context>().create();
const publicProcedure = t.procedure;
const router = t.router;
const mergeRouters = t.mergeRouters;


// created for each request
const createContext = ({ }: trpcExpress.CreateExpressContextOptions) => ({}); // no context

type Context = inferAsyncReturnType<typeof createContext>;



export { createContext, publicProcedure, mergeRouters, router }

