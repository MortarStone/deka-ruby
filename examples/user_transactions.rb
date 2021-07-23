require_relative 'helper'

transactions = @client.user_transactions(1)
print_transactions(transactions)
