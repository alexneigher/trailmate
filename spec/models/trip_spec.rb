require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe "#check_in_time_has_past" do
    let(:user){ create(:user)}

    context 'for a check in that has already occured' do
      let!(:trip){ create(:trip, check_in_time: 3.weeks.ago, user: user) }

      it 'returns true' do
        expect(trip.check_in_time_has_past?).to be true
      end
    end

    context 'for a check in that is in the future' do
      let!(:trip){ create(:trip, check_in_time: Time.now.advance(days: +2), user: user) }

      it 'returns false' do
        expect(trip.check_in_time_has_past?).to be false
      end
    end
  end
end
