# frozen_string_literal: true

require 'yaml'
require 'openai'
require 'dotenv/load'
require './app/use_cases/base_use_case'
require './app/services/prompt_service'

class OpenAIService
  include BaseUseCase
  attr_accessor :response

  def initialize(messages:, behavior:)
    OpenAI.configure do |config|
      config.access_token = ENV.fetch('OPENAI_API_KEY', nil)
    end
    @client = OpenAI::Client.new
    @messages = messages
    @behavior = behavior
  end

  def perform
    prompt = PromptService.perform(
      messages: messages,
      behavior: behavior,
      to_replace: '@MESSAGES'
    ).prompt

    @perform ||= get_response(prompt: prompt)
  end

  private

  attr_reader :messages, :behavior

  def get_response(prompt:) # rubocop:disable Metrics/MethodLength
    response = @client.chat(
      parameters: {
        model: 'gpt-3.5-turbo',
        messages: [
          { role: 'system', content: 'Você é um assistente muito útil' },
          { role: 'user', content: prompt }
        ],
        temperature: 0.7
      }
    )

    JSON.parse(response.dig('choices', 0, 'message', 'content'))
  end
end
