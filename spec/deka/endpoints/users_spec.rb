require "spec_helper"

RSpec.describe Deka::Endpoints::Users do
  describe '#users', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @users = @client.users('page[size]': 10).body
    end

    it 'returns an array' do
      expect(@users[:data]).to be_an(Array)
    end

    it 'returns family objects' do
      expect(@users[:data].first).to be_a(Hash)
      expect(@users[:data].first[:id]).to_not be_nil
    end
  end

  describe '#user', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @user = @client.user(1520).body
    end

    it 'returns a user object' do
      expect(@user[:data]).to be_a(Hash)
      expect(@user[:data][:id]).to eq(1520)
    end
  end
end
