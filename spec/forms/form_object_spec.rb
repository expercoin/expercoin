# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FormObject do
  let(:form_attributes) { attributes_for :form_object }
  let(:form_object) { FormObject.new(form_attributes) }

  describe '.initialize' do
    it { expect(form_object.is_a?(FormObject)).to eq true }
    it { expect(form_object.is_a?(ActiveModel::Model)).to eq true }
    pending 'tests for settings attributes from model'
  end

  describe '.update' do
    pending 'tests for update'
  end
end
