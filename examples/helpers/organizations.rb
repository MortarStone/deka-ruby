def print_organizations(list)
  print_list("organization", "id", list)
end

def print_organization(item)
  print_item('organization', item)
end

def organization_columns
  %w[
    id
    uuid
    org_name
    email
    slug
    phone
    mobile
    address
    city
    state_province
    postal
    created_at
    updated_at
  ]
end
