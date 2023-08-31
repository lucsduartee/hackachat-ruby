# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './app/models/course/course'
require 'dotenv'
Dotenv.load

# rubocop:disable Style/Documentation
class IndicaAiApi < Sinatra::Base    
  configure do
    register Sinatra::Reloader
    set :content_type, :json
  end
  
  get '/' do
    'Hello world!'
  end

  get '/courses' do
    content_type :json
    { 'course' => Course.all }.to_json
  end

  post '/courses' do
    course = course_params

    {
      'course' => Course.create(
        name: course['name'],
        description: course['description'],
        tag_id: course['tag_id'],
        page_content: course['page_content']
      )
    }.to_json
  end

  private

  def course_params
    JSON.parse(request.body.read).dig('course')
  end

  run! if app_file == $0
end
