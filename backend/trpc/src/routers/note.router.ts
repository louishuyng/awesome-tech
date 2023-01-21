import { z } from 'zod';
import { Note } from '../db';
import { publicProcedure, router } from '../trpc';

export const noteRouter = router({
  create: publicProcedure
    .input(
      z.object({
        name: z.string(),
        state: z.enum(['todo', 'completed']).optional(),
        priority: z.enum(['high', 'medium', 'low', 'none']).optional(),
      }),
    )
    .mutation(async ({ input }) => {
      const data = await Note.create(input)

      return data
    }),
  update: publicProcedure
    .input(
      z.object({
        id: z.number(),
        data: z.object({
          name: z.string(),
          state: z.enum(['todo', 'completed']).optional(),
          priority: z.enum(['high', 'medium', 'low', 'none']).optional(),
        })
      }),
    )
    .mutation(async ({ input }) => {
      const affected = await Note.update(input.data, {
        where: { id: input.id }
      })

      let message: string;
      if (affected[0] === 1) {
        message = "Tutorial was updated successfully."
      } else {
        message = `Cannot update Note with id=${input.id}. Maybe Note was not found or input is empty!`
      }

      return { message }
    }),

  list: publicProcedure
    .input(
      z.object({
        filter: z.object({
          state: z.enum(['todo', 'completed']).optional(),
          priority: z.enum(['high', 'medium', 'low', 'none']).optional(),
        })
      }).optional(),
    )
    .query(async ({ input }) => {
      const data = await Note.findAll({
        where: {
          state: input?.filter?.state || ['todo', 'completed'],
          priority: input?.filter?.priority || ['high', 'medium', 'low', 'none']
        }
      })

      return data
    }),
  delete: publicProcedure
    .input(
      z.number(),
    )
    .mutation(async ({ input }) => {
      const data = await Note.destroy({ where: { id: input } })

      return data
    }),
});
