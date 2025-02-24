def print_families(list)
  print_list("family", "id", list)
end

def print_family(item)
  print_item('family', item)
end

def family_columns
  %w[
    id
    name
    primary_contact
    created_at
    updated_at
    deleted_at
  ]
end
