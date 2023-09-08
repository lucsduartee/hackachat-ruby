# frozen_string_literal: true

require './app/use_cases/base_use_case'

class PromptService
  include BaseUseCase

  PROMPTS = YAML.load_file('prompts.yml')

  attr_accessor :prompt, :behavior, :messages, :to_replace, :conversation

  def initialize(behavior:, messages: nil, to_replace: nil)
    @behavior = behavior
    @messages = messages
    @to_replace = to_replace
    @conversation = ''
  end

  def perform
    load_prompt
    join_messages unless messages.nil?
    join_prompt unless messages.nil?
  end

  private

  def join_messages
    @messages.each do |message|
      @conversation += "#{message['user']}: #{message['text']} -- "
    end
  end

  def join_prompt
    @prompt = prompt.gsub(to_replace, conversation)
  end

  def load_prompt
    @prompt = PROMPTS['system_behavior'][behavior]
  end
end
