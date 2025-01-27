require_relative 'helper'

response = @client.user_family(613)
print_family(response)
