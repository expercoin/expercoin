# frozen_string_literal: true

module Helpers
  def contain_all?(attrs, params)
    attrs = attrs.with_indifferent_access
    params = params.with_indifferent_access
    attrs.merge(params) == attrs
  end

  def include_each?(object, attrs = [])
    attrs.each { |attr| break false unless object.to_s.include?(attr.to_s) }.present?
  end
end
