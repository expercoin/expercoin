class Page < ApplicationRecord
  belongs_to :content, polymorphic: true, optional: true

  validates_presence_of :url
end
