# frozen_string_literal: true

module Helpers
  def contain_all?(attrs, params)
    attrs = attrs.with_indifferent_access
    params = params.with_indifferent_access
    attrs.merge(params) == attrs
  end
end
