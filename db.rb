# Database Configuration
# ======================
# Documentation: https://deveiate.org/code/pg/PG.html
# Use this module to:
# - Connect to the adventure database
# - CRUD operations (CREATE, SELECT, ALTER, DELETE)
#

# CONTROLER

require 'pg'

# Create a connection to our database
def connection
  # This line of code will allow us to execute SQL commands.
  # This function returns that connection and you can see how we use it below.
  PG::Connection.new(dbname: 'library')
  p "Connected to database ..."
end

def init_db
  connection.exec("CREATE DATABASE IF NOT EXISTS adventure")
  connection.exec("CREATE TABLE IF NOT EXISTS players (id SERIAL PRIMARY KEY, name VARCHAR(255), skill VARCHAR(255) )")
  connection.exec("CREATE TABLE IF NOT EXISTS items (id SERIAL PRIMARY KEY, name VARCHAR(255), description VARCHAR(255), stats JSON )")
end

def add_item(options)
  connection.exec_params("INSERT INTO items (name, description, stats) VALUES ($1, $2, $3)", options)
  p "Item created: #{first_name} #{last_name}"
end

# Output a table of current data in our database by running this script: `ruby db.rb`
# You'll see it print out a table of the current contents of our database
connection.exec( "SELECT * FROM items" ) do |result|
  puts "ID | name"
  result.each do |row|
    puts " %s | %s" % row.values_at('id', 'title')
  end
end
