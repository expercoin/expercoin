module CustomValidator
  extend ActiveSupport::Concern

  def valid?(resource = nil)
    @validator = "#{self.class.name}Validator".constantize.new(self)
    @validator.valid?
  end

  def errors
    @validator.errors
  end
end
