require_relative 'helper'

# transactions = @client.transactions('filter[status]' => 'success,settled,refunded')
response = @client.transactions('filter[status]' => 'success,settled,refunded,failed,voided,pending,declined')
print_transactions(response)
