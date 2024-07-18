require_relative 'helper'

# transactions = @client.transactions('filter[status]' => 'success,settled,refunded')
transactions = @client.transactions('filter[status]' => 'success,settled,refunded,failed,voided,pending,declined')
print_transactions(transactions)
