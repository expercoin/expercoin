class Page < ApplicationRecord
  belongs_to :content, polymorphic: true
end
