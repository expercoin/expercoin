# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BasePresenter do
  let(:base_presenter) { BasePresenter.new('model', 'view') }
  describe '.initialize' do
    it { expect(base_presenter.is_a?(BasePresenter)).to eq true }
  end

  describe '.h' do
    it { expect(base_presenter.h).to eq 'view' }
  end
end
