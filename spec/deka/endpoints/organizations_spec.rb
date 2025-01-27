require "spec_helper"

RSpec.describe Deka::Endpoints::Families do
  describe '#organization', :vcr do
    let(:organization_uuid) { ENV.fetch('ORGANIZATION_UUID', nil) }

    before do
      @client = FactoryBot.build(:client)
      @organization = @client.organization.body
    end

    it 'returns a organization object' do
      expect(@organization[:data]).to be_a(Hash)
      expect(@organization[:data][:id]).to eq(118)
    end
  end
end
