# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :group

  validates_presence_of :title, :content
end
