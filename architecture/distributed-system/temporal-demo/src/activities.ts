export async function greet(name: string): Promise<string> {
  return `Hello, ${name}!`;
}

export async function logGreet(name: string): Promise<string> {
  return `Logged: ${name}!`;
}
