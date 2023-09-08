# frozen_string_literal: true

require 'sinatra/base'
require './app/services/openai_service'

class QuestionsController < Sinatra::Base
  post '/question' do
    response = OpenAIService.perform(
      messages: params[:messages],
      behavior: 'classifier'
    ).response

    { 'response' => response }.to_json
  end
end
