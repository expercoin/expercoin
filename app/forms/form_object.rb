# frozen_string_literal: true

# Form Object base class
class FormObject
  include ActiveModel::Model
  include Virtus.model

  def initialize(*attrs)
    attrs.each do |attr|
      if attr.is_a?(ActiveRecord::Base)
        self.attributes = attr.attributes
      else
        self.attributes = attr
      end
    end
  end

  def update; end
end
