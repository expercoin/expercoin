require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  let(:wishlist) { create(:wishlist) }

  describe '.initialize' do
    it { expect(wishlist).to be_valid }
  end

  describe 'Associations' do
    it { expect(wishlist).to belong_to :profile }
    it { expect(wishlist).to belong_to :service }
    it { expect(wishlist).to belong_to :wishlisted_service }
  end
end
