require 'pry'
require 'active_support/inflector'
require 'bigdecimal'
require_relative '../lib/deka'
require_relative 'helpers/families'
require_relative 'helpers/organizations'
require_relative 'helpers/purposes'
require_relative 'helpers/transactions'
require_relative 'helpers/users'

require 'dotenv'
Dotenv.load('../.env')

@client = Deka::Client.new(
  personal_access_token: ENV.fetch('PERSONAL_ACCESS_TOKEN', nil),
  organization_uuid: ENV.fetch('ORGANIZATION_UUID', nil),
  environment: ENV.fetch('ENVIRONMENT', nil)
)

def print_no_access_message
  puts "Unless something has recently changed, we do not have access to this table or the table does not exist."
end

def print_list(object_name, pk_id_name, response)
  print_headers(response.headers)

  list = response.body[:data]
  if list.nil? || list.empty?
    puts 'Nothing found'
  else
    headers = column_headers(object_name)
    puts "There were #{list.count} #{object_name.pluralize} found"
    puts
    puts print_column_headers(headers)
    list.each_with_index do |item, index|
      print_row(index, item, headers)
    end
    puts
    print_duplicates(pk_id_name, list)
  end
end

def column_headers(object_name)
  send("#{object_name}_columns")
end

def print_column_headers(headers)
  headers = [:index] + headers
  puts headers.join(" :: ")
end

def print_row(index, item, column_headers)
  cells = [index]
  column_headers.each do |header|
    value = item[header]
    value = value.to_digits if value.instance_of?(BigDecimal)
    cells << value
  end
  puts cells.join(" :: ")
end

def print_item(object_name, response)
  print_headers(response.headers)

  item = response.body[:data]
  puts
  if item.nil?
    puts "Item not found"
  else
    column_headers(object_name).each do |header|
      value = item[header]
      value = value.to_digits if value.instance_of?(BigDecimal)
      puts "#{header}: #{value}"
    end
  end
end

def print_duplicates(pk_id_name, list)
  counts = {}
  list.each do |item|
    id = item[pk_id_name]
    counts[id] ||= 0
    counts[id] += 1
  end

  duplicates = counts.select { |_key, value| value > 1 }.keys - [nil]
  puts "There are #{duplicates.count} duplicates: #{duplicates.inspect}"
end

def print_headers(headers)
  puts "Headers"
  headers.each do |k, v|
    puts "#{k}: #{v}"
  end
  puts
end
