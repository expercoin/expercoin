# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MailRecord, type: :model do
  let(:mail_record) { build(:mail_record) }

  describe 'Factory' do
    it { expect(mail_record).to be_valid }
  end
end
