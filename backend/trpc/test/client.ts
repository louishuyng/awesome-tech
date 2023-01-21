import { createTRPCProxyClient, httpBatchLink } from '@trpc/client';
import config from '../src/config';
import { AppRouter } from '../src/routers';

const client = createTRPCProxyClient<AppRouter>({
  links: [
    httpBatchLink({
      url: `http://localhost:${config.SERVER_PORT}/trpc`,
    }),
  ],
});

client.note.create.mutate({
  name: 'drink water',
})

client.note.create.mutate({
  name: 'study',
  state: 'completed',
  priority: 'high'
})

client.note.list.query({ filter: { priority: 'high' } }).then((data) => {
  console.log(data)
})
