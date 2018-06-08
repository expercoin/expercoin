class UniqueValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    class_name = record.class.name.gsub('Validator', '')
    match = class_name.constantize.find_by("#{attribute}": value)
    unless match.nil? || match == record.send(class_name.downcase)
      record.errors.add(attribute, "must be unique")
    end
  end
end
