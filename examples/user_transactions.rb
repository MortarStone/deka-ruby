require_relative 'helper'

response = @client.user_transactions(413)
print_transactions(response)
