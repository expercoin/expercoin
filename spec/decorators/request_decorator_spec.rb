# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RequestDecorator do
  let(:expert) { create(:profile, expercoin_rate: 0.5) }
  let(:request) { create(:request, expert: expert, requested_length: '30min') }
  let(:request_decorator) { RequestDecorator.new(request) }

  describe '.session_date' do
    context 'when selected date' do
      before do
        selected_date = request.sugested_times.sample
        request.update(
          selected_date: selected_date['formated_datetime']
        )
        request.reload
      end
      it 'should include year in output' do
        expect(request_decorator.session_date).to include(request.selected_date.year.to_s)
      end
      it 'should include timezone in output' do
        expect(request_decorator.session_date).to include(request.time_zone)
      end
    end

    context 'when not selected date' do
      it 'should show correct date format' do
        datetime_formated = request.created_at.strftime('%b %d, %Y at %l:%M %P')
        expect(request_decorator.session_date).to eq datetime_formated
      end
    end
  end

  describe '.amount' do
    it 'should show correct amount' do
      expect(request_decorator.amount).to eq 15
    end
  end

  describe '.usd_amount' do
    it 'should show correct usd amount' do
      usd_amount = Eth::UsdConverter.new(15).usd_value.round(2)
      expect(request_decorator.usd_amount).to eq usd_amount
    end
  end

  describe '.call_ready?' do
    let(:request) { create(:request, :verified, expert: expert, requested_length: '30min') }

    context 'when true' do
      it { expect(request_decorator.call_ready?).to eq true }
    end

    # context 'when false' do
    #   it { expect(request_decorator.call_ready?).to false  }
    # end
  end
end
