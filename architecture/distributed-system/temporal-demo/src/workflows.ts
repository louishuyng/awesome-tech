import * as workflow from '@temporalio/workflow';
// Only import the activity types
import type * as activities from './activities';

const { greet, logGreet } = workflow.proxyActivities<typeof activities>({
  startToCloseTimeout: '1 minute',
});

export async function test(name: string, delayMs: number): Promise<string> {
  await greet(name);

  await workflow.sleep(delayMs);

  return await logGreet(name);
}
