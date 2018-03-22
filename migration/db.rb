require "sqlite3"

database_name = 'lords_attendance.db'

if File.exist?(database_name)
  File.delete(database_name)
end

db = SQLite3::Database.new(database_name)

row = db.execute <<-SQL
  CREATE TABLE sittings_index (
    sitting_date VARCHAR(10),
    sitting_url VARCHAR(255)
  );
SQL

class SittingsEntry

attr_reader :date, :url

  def initialize(row)
    @date = row[0]
    @url = row[1]
  end
end

db.execute "INSERT INTO sittings_index VALUES ('2017-01-30', 'http://data.parliament.uk/resources/725649')"
db.execute "INSERT INTO sittings_index VALUES ('2017-01-31', 'http://data.parliament.uk/resources/725650')"

sittings_entries = db.execute( "SELECT * FROM sittings_index").map { |row| SittingsEntry.new(row) }

puts sittings_entries.map { |entry| entry.url }

# rows.each { |row| puts row[0] + ", " + row[1]}
#
# rows.each { |row| puts sitting_entry.date + ", " + sitting_entry.url}
