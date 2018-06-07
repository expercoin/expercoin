class UniqueValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    class_name = record.class.name.gsub('Validator', '')
    instance = class_name.constantize.find_by("#{attribute}": value)
    if instance.present?
      record.errors.add(attribute, "must be unique")
    end
  end
end
