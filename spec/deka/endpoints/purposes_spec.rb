require "spec_helper"

RSpec.describe Deka::Endpoints::Purposes do
  describe '#purposes', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @purposes = @client.purposes('page[size]': 10)
    end

    it 'returns an array' do
      expect(@purposes[:data]).to be_an(Array)
    end

    it 'returns purpose objects' do
      expect(@purposes[:data].first).to be_a(Hash)
      expect(@purposes[:data].first[:id]).to_not be_nil
    end
  end
end
