# frozen_string_literal: true

require 'spec_helper'
require './app/indicai_api'

RSpec.describe IndicaAiApi do
  def app
    IndicaAiApi
  end

  describe 'GET home' do
    context 'when ok' do
      it 'returns hello word' do
        get '/'

        expect(last_response.body).to eq('Hello world!')
        expect(last_response.status).to eq 200
      end
    end
  end
end
