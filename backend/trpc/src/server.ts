import * as trpcExpress from '@trpc/server/adapters/express';
import express from 'express'
import config from './config'
import db from './db';
import { createContext } from './trpc';
import { appRouter } from './routers';

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
