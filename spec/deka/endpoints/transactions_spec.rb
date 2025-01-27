require "spec_helper"

RSpec.describe Deka::Endpoints::Transactions do
  describe '#transactions', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @transactions = @client.transactions('page[size]': 10).body
    end

    it 'returns an array' do
      expect(@transactions[:data]).to be_an(Array)
    end

    it 'returns family objects' do
      expect(@transactions[:data].first).to be_a(Hash)
      expect(@transactions[:data].first[:id]).to_not be_nil
    end
  end

  describe '#transaction', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @transaction = @client.transaction(13_168).body
    end

    it 'returns a transaction object' do
      expect(@transaction[:data]).to be_a(Hash)
      expect(@transaction[:data][:id]).to eq(13_168)
    end
  end
end
