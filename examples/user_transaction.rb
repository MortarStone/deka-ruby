require_relative 'helper'

response = @client.user_transaction(413, 1_405)
print_transaction(response)
