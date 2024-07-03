require_relative 'helper'

# transactions = @client.transactions('filter[status]' => 'success,settled,refunded')
transactions = @client.transactions('filter[status]' => 'failed,voided,pending,declined', 'page[number]' => 11)
print_transactions(transactions)
