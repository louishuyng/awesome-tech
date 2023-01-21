import { inferAsyncReturnType, initTRPC } from '@trpc/server';
import * as trpcExpress from '@trpc/server/adapters/express';
import express from 'express'
import config from './config'
import db from './db';

const t = initTRPC.context<Context>().create();

const appRouter = t.router({});

// Export type router type signature,
// NOT the router itself.
export type AppRouter = typeof appRouter;

// created for each request
const createContext = ({ }: trpcExpress.CreateExpressContextOptions) => ({}); // no context

type Context = inferAsyncReturnType<typeof createContext>;

const app = express();

app.use(
  '/trpc',
  trpcExpress.createExpressMiddleware({
    router: appRouter,
    createContext,
  }),
);
console.log('Server is listening on port ' + config.SERVER_PORT);

app.listen(config.SERVER_PORT, async () => {
  await db.connect()
});
