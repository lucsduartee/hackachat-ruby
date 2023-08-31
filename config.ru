# frozen_string_literal: true

require './app'
require 'sinatra/reloader'
require 'dotenv'
Dotenv.load

run IndicaAiApi
