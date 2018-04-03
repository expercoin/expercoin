# Form Object base class
class FormObject
  include ActiveModel::Model
  include Virtus.model

  def initialize; end

  def update; end
end
