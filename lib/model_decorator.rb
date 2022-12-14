# frozen_string_literal: true

require_relative "model_decorator/version"

#
# ModelDecorator
#
module ModelDecorator
  class Error < StandardError; end

  def self.included(base)
    base.extend ClassMethods
  end

  #
  # ClassMethods
  #
  module ClassMethods
    require "delegate"

    def decorate_with(klass, as:)
      raise Error, "Expecting #{klass} to be Class" unless klass.is_a? Class
      raise Error, "Expecting #{klass} to inherit from SimpleDelegator" unless klass < ::SimpleDelegator
      raise Error, "Expecting #{as} to be Symbol" unless as.is_a? Symbol

      define_method as do
        klass.new(self)
      end

      self
    end
  end
end
