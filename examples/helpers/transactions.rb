def print_transactions(list)
  print_list("transaction", "id", list)
end

def print_transaction(item)
  print_item('transaction', item)
end

def transaction_columns
  [
    :id,
    :payment_type,
    :purpose_id,
    :status,
    :amount,
    :user_id,
    :date,
    :created_at,
    :updated_at,
    :deleted_at
  ]
end
