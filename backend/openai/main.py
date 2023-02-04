import os
import openai

# Load your API key from an environment variable or secret management service
openai.api_key = os.getenv("OPENAI_API_KEY")

response = openai.Image.create(
    prompt="Claw crane with soft toy anime logo",
    n=1,
    size="1024x1024"
)
image_url = response['data'][0]['url']
print(image_url)
