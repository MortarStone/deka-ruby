require_relative 'helper'

response = @client.transaction(1_575)
print_transaction(response)
