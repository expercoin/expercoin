# frozen_string_literal: true

# Form Object base class
class FormObject
  include ActiveModel::Model
  include Virtus.model

  def initialize(*attrs)
    attrs.each do |attr|
      next unless attr
      next self.attributes = attr.attributes if attr.is_a?(ActiveRecord::Base)
      self.attributes = attr
    end
  end

  def update(object)
    return unless valid?
    object.update(attributes.compact)
  end

  def new
    class_name.constantize.new(attributes.compact)
  end

  private

  def class_name
    self.class.name.gsub('Form', '')
  end
end
