# frozen_string_literal: true

# Base Validator for validators pattern
class BaseValidator
  include ActiveModel::Validations

  def initialize; end
end
