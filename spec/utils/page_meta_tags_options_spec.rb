# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageMetaTagsOptions do
  let(:page) { create(:page, :service) }
  let(:meta_tags_options) { described_class.new(page) }
  let(:page_options) do
    {
      site: page.name,
      title: page.title,
      description: page.description,
      keywords: page.keywords
    }
  end

  describe '.initialize' do
    it { expect { meta_tags_options }.not_to raise_error }
  end

  describe '.default_options' do
    it { expect(meta_tags_options.default_options >= page_options).to eq true }
  end
end
