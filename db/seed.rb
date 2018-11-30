require 'csv'
require 'sqlite3'

  def csv_to_array(file_name)
    array = []
    CSV.foreach(file_name) {|line| array <<  line}
    array
  end

daily_show_guests = csv_to_array('../daily_show_guests.csv')
daily_show_guests.pop
daily_show_guests.shift

db =SQLite3::Database.new( "test_database.db" )

db.execute <<-SQL
  create table daily_show_guests (
    id INTEGER PRIMARY KEY,
    Year TEXT,
    GoogleKnowledge_Occupation TEXT,
    Show TEXT,
    Category DOUBLE,
    Guest TEXT
  );
SQL

daily_show_guests.each do |guest|
  db.execute("INSERT INTO daily_show_guests (Year, 'GoogleKnowledge_Occupation', Show, Category, Guest)
            VALUES (?, ?, ?, ?, ?)", [guest[0], guest[1], guest[2], guest[3], guest[4]])
end



# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
