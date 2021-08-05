def print_purposes(list)
  print_list("purpose", "id", list)
end

def print_purpose(item)
  print_item('purpose', item)
end

def purpose_columns
  [
    :id,
    :name,
    :active,
    :created_at,
    :updated_at,
    :deleted_at
  ]
end
