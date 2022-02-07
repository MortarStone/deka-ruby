FactoryBot.define do
  factory :client, class: Deka::Client do
    organization_uuid { ENV['ORGANIZATION_UUID'] }
    personal_access_token { ENV['PERSONAL_ACCESS_TOKEN'] }

    initialize_with do
      new(
        organization_uuid: organization_uuid,
        personal_access_token: personal_access_token,
        environment: 'production'
      )
    end
  end

  factory :invalid_client, class: Deka::Client do
    organization_uuid { 'Fake' }
    personal_access_token { 'Credentials' }

    initialize_with do
      new(
        organization_uuid: organization_uuid,
        personal_access_token: personal_access_token,
        environment: 'production'
      )
    end
  end
end
