# frozen_string_literal: true

module Helpers
  def include_each?(object, attrs = [])
    attrs.each { |attr| break false unless object.to_s.include?(attr.to_s) }.present?
  end
end
