module ApplicationHelper
  def present(model, presenter_class=nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
  end

  def decorate(model, decorate_class=nil)
    klass = decorate_class || "#{model.class}Decorate".constantize
    decorate = klass.new(model)
  end
end
