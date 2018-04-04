# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasePresenter do
  let(:test_class_instance) { Class.new }
  let(:base_presenter) { BasePresenter.new(test_class_instance, 'view') }
  describe '.initialize' do
    it { expect(base_presenter.is_a?(BasePresenter)).to eq true }
  end

  describe '.h' do
    it { expect(base_presenter.h).to eq 'view' }
  end

  describe '@model' do
    it 'is not nil' do
      expect(base_presenter.instance_variable_get(:@model).nil?).to eq false
    end
  end

  describe '@view' do
    it 'is not nil' do
      expect(base_presenter.instance_variable_get(:@view).nil?).to eq false
    end
  end
end
