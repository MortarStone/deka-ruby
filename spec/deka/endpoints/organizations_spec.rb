require "spec_helper"

RSpec.describe Deka::Endpoints::Families do
  describe '#organization', :vcr do
    let(:organization_uuid) { ENV['ORGANIZATION_UUID'] }

    before do
      @client = FactoryBot.build(:client)
      @organization = @client.organization
    end

    it 'returns a organization object' do
      expect(@organization[:data]).to be_a(Hash)
      expect(@organization[:data][:id]).to eq(129)
    end
  end
end
