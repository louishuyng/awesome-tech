// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

serve(async (req) => {
  const { source, target, amount } = await req.json()

  const url = `https://pro-api.coinmarketcap.com/v2/tools/price-conversion?symbol=${source}&convert=${target}&amount=${amount}`

  const result = await fetch(url, { method: 'GET', headers: { 'X-CMC_PRO_API_KEY': Deno.env.get('COINMARKETCAP_API_KEY') } })
  console.log("Called to: ", url)

  const data = (await result.json())
  return new Response(JSON.stringify(data), { headers: { "Content-Type": "application/json" } },
  )
})

