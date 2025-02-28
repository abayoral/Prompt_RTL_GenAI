from abc import ABC, abstractmethod
import openai
from anthropic import Anthropic
from transformers import AutoTokenizer, AutoModelForCausalLM
import torch
import os
from conversation import Conversation

# Abstract Large Language Model
class AbstractLLM(ABC):
    """Abstract Large Language Model."""
    def __init__(self):
        pass

    @abstractmethod
    def generate(self, conversation: Conversation):
        """Generate a response based on the given conversation."""
        pass

class ChatGPT3p5(AbstractLLM):
    def __init__(self):
        super().__init__()
        openai.api_key = os.environ['OPENAI_API_KEY']

    def generate(self, conversation: Conversation):
        messages = [{'role': msg['role'], 'content': msg['content']} for msg in conversation.get_messages()]
        response = openai.ChatCompletion.create(model="gpt-3.5-turbo-16k", messages=messages)
        return response['choices'][0]['message']['content']

class ChatGPT4(AbstractLLM):
    def __init__(self):
        super().__init__()
        openai.api_key = os.environ['OPENAI_API_KEY']

    def generate(self, conversation: Conversation):
        messages = [{'role': msg['role'], 'content': msg['content']} for msg in conversation.get_messages()]
        response = openai.ChatCompletion.create(model="gpt-4", messages=messages)
        return response['choices'][0]['message']['content']

class ChatGPT4o(AbstractLLM):
    def __init__(self):
        super().__init__()
        openai.api_key = os.environ['OPENAI_API_KEY']

    def generate(self, conversation: Conversation):
        messages = [{'role': msg['role'], 'content': msg['content']} for msg in conversation.get_messages()]
        response = openai.ChatCompletion.create(model="gpt-4o", messages=messages)
        return response['choices'][0]['message']['content']

class ChatGPT4omini(AbstractLLM):
    def __init__(self):
        super().__init__()
        openai.api_key = os.environ['OPENAI_API_KEY']

    def generate(self, conversation: Conversation):
        messages = [{'role': msg['role'], 'content': msg['content']} for msg in conversation.get_messages()]
        response = openai.ChatCompletion.create(model="gpt-4o-mini", messages=messages)
        return response['choices'][0]['message']['content']

class ChatGPTo3mini(AbstractLLM):
    """O3-mini Large Language Model."""
    def __init__(self):
        super().__init__()
        openai.api_key = os.environ['OPENAI_API_KEY']

    def generate(self, conversation: Conversation):
        messages = [{'role': msg['role'], 'content': msg['content']} for msg in conversation.get_messages()]
        response = openai.ChatCompletion.create(model="o3-mini", messages=messages)
        return response['choices'][0]['message']['content']

class Claude(AbstractLLM):
    def __init__(self):
        super().__init__()
        self.anthropic = Anthropic(api_key=os.environ['ANTHROPIC_API_KEY'])

    def generate(self, conversation: Conversation):
        prompt = "".join(f"\n\nHuman: {msg['content']}" if msg['role'] == 'user' else f"\n\nAssistant: {msg['content']}" for msg in conversation.get_messages())
        prompt += "\n\nAssistant:"
        completion = self.anthropic.completions.create(model="claude-2", max_tokens_to_sample=3000, prompt=prompt)
        return completion.completion

class CodeLlama(AbstractLLM):
    def __init__(self, model_id="codellama/CodeLlama-13b-hf"):
        super().__init__()
        self.tokenizer = AutoTokenizer.from_pretrained(model_id)
        self.model = AutoModelForCausalLM.from_pretrained(model_id, device_map="auto", torch_dtype="auto")

    def _format_prompt(self, conversation: Conversation) -> str:
        messages = conversation.get_messages()
        prompt = "".join(f"<s>[INST] {msg['content']} [/INST] " if msg['role'] == 'user' else msg['content'] for msg in messages)
        return prompt

    def generate(self, conversation: Conversation):
        prompt = self._format_prompt(conversation)
        inputs = self.tokenizer(prompt, return_tensors="pt").to("cuda")
        output = self.model.generate(inputs["input_ids"], max_new_tokens=3000, do_sample=True, top_p=0.9, temperature=0.1)
        return self.tokenizer.decode(output[0].to("cpu")).split("[/INST]")[-1].strip()
