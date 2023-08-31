# frozen_string_literal: true

require 'sinatra/activerecord'

# rubocop:disable Style/Documentation
class Course < ActiveRecord::Base
  self.table_name = 'courses'
end
