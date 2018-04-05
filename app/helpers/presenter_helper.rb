# frozen_string_literal: true

# Helpers for presenter
module PresenterHelper
  def present(model, presenter_class = nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    return yield(presenter) if block_given?
    presenter
  end
end
