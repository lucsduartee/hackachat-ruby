# frozen_string_literal: true

require 'sinatra/activerecord'

class Course < ActiveRecord::Base
  self.table_name = 'courses'
end
