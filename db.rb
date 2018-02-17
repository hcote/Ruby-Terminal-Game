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
  PG::Connection.new(dbname: 'beatbowser')
  # p "Connected to database ..."
end

def init_db
  # connection.exec("CREATE DATABASE IF NOT EXISTS beatbowser")
  connection.exec("CREATE TABLE IF NOT EXISTS players (id SERIAL PRIMARY KEY, name VARCHAR(255), health INT)")
  # connection.exec("CREATE TABLE IF NOT EXISTS items (id SERIAL PRIMARY KEY, name VARCHAR(255), description VARCHAR(255), stats JSON )")
  p "Created to table ..."
end

def add_player(player_name)
  connection.exec("INSERT INTO players (name, health) VALUES ('#{player_name}', 50)")
  p "Item created: #{player_name}"
end

def update_player1(player_name)
  connection.exec('UPDATE players
  SET health=health-5
  WHERE id=1')
end

def update_player2(player_name1)
  UPDATE players
  SET health-=5
  WHERE id=2
end
#
# # Output a table of current data in our database by running this script: `ruby db.rb`
# # You'll see it print out a table of the current contents of our database
# connection.exec( "SELECT * FROM items" ) do |result|
#   puts "ID | name"
#   result.each do |row|
#     puts " %s | %s" % row.values_at('id', 'title')
#   end
# end
