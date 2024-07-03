require "spec_helper"

RSpec.describe Deka::Endpoints::Families do
  describe '#families', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @families = @client.families('page[size]': 10)
    end

    it 'returns an array' do
      expect(@families[:data]).to be_an(Array)
    end

    it 'returns family objects' do
      expect(@families[:data].first).to be_a(Hash)
      expect(@families[:data].first[:id]).to_not be_nil
    end
  end

  describe '#user_family', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @user_family = @client.user_family(613)
    end

    it 'returns a user_family object' do
      expect(@user_family[:data]).to be_a(Hash)
      expect(@user_family[:data][:id]).to eq(610)
    end
  end
end
