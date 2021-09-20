# frozen_string_literal: true

require "spec_helper"

RSpec.describe Deka::Client do
  describe '#connect', :vcr do
    context 'with valid organization_uuid and personal_access_token' do
      it 'creates a connection' do
        client = FactoryBot.build(:client)
        expect(client).to be_a(Deka::Client)
      end
    end

    context 'with invalid organization_uuid' do
      it 'raises an error' do
        client = FactoryBot.build(:client, organization_uuid: 'aklsdjf')
        expect { client.users }.to raise_exception(Deka::Exceptions::DStandardError)
      end
    end
  end
end
