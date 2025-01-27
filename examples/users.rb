require_relative 'helper'

response = @client.users # ('filter[has_family]': false)
print_users(response)
