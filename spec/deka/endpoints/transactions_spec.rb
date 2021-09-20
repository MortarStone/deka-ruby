require "spec_helper"

RSpec.describe Deka::Endpoints::Transactions do
  describe '#transactions', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @transactions = @client.transactions('page[size]': 10)
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
      @transaction = @client.transaction(1)
    end

    it 'returns a transaction object' do
      expect(@transaction[:data]).to be_a(Hash)
      expect(@transaction[:data][:id]).to eq(1)
    end
  end

  describe '#user_transactions', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @user_transactions = @client.user_transactions(1, 'page[size]': 10)
    end

    it 'returns an array' do
      expect(@user_transactions[:data]).to be_an(Array)
    end

    it 'returns family objects' do
      expect(@user_transactions[:data].first).to be_a(Hash)
      expect(@user_transactions[:data].first[:id]).to_not be_nil
    end
  end

  describe '#user_transaction', :vcr do
    before do
      @client = FactoryBot.build(:client)
      @user_transaction = @client.user_transaction(1, 1)
    end

    it 'returns a user_transaction object' do
      expect(@user_transaction[:data]).to be_a(Hash)
      expect(@user_transaction[:data][:id]).to eq(1)
    end
  end
end
