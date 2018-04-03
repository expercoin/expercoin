# frozen_string_literal: true

# Helpers for decorators
module DecoratorHelper
  def decorate(model, decorate_class = nil)
    klass = decorate_class || "#{model.class}Decorate".constantize
    klass.new(model)
  end
end
