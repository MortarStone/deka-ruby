def print_users(list)
  print_list("user", "id", list)
end

def print_user(item)
  print_item('user', item)
end

def user_columns
  %w[
    id
    family_id
    first_name
    last_name
    created_at
    updated_at
    deleted_at
  ]
end
