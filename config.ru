# frozen_string_literal: true
require 'rack/contrib'
require './app'

use Rack::JSONBodyParser

run IndicaAiApi
