require_relative 'helper'

transaction = @client.user_transaction(1, 1)
print_transaction(transaction)
