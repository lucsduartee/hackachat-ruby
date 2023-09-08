# frozen_string_literal: true

require 'active_support/concern'

module BaseUseCase
  extend ActiveSupport::Concern

  module ClassMethods
    def perform(**kwargs)
      new(**kwargs).tap(&:perform)
    end
  end

  def perform
    raise NotImplementedError
  end
end
