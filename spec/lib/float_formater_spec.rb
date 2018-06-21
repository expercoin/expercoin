# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FloatFormater do
  VALUES = [
    {
      key: :formated, val: 0.0001, result: 0.0001,
      desc: 'returns passed value if correct format'
    },
    {
      key: :long_formated, val: 0.0000133, result: 1.33e-05,
      desc: 'returns passed Euler number formated value if correct format'
    },
    {
      key: :unformated, val: 0.000434341, result: '0.00043...',
      desc: 'returns formated value'
    }
  ].freeze

  VALUES.each do |obj|
    let("#{obj[:key]}_number") { obj[:val] }
    let("#{obj[:key]}_number_instance") { described_class.new(send("#{obj[:key]}_number")) }

    describe obj[:desc] do
      it { expect(send("#{obj[:key]}_number_instance").with_dots).to eq obj[:result] }
    end
  end

  describe '.initialize' do
    it { expect { formated_number_instance }.not_to raise_error }
  end
end
