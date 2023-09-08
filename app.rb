# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './app/models/course'
require './app/services/openai_service'
require './app/controllers/questions_controller'

class IndicaAiApi < Sinatra::Base
  use QuestionsController

  configure do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello Changes!'
  end

  run! if app_file == $PROGRAM_NAME
end
