# Write methods that return SQL queries for each part of the challeng here

def guest_with_most_appearances
  "SELECT guest, COUNT(show) FROM daily_show_guests GROUP BY guest ORDER BY COUNT(show) DESC LIMIT 1;"
end

def most_popular_profession_each_year
  "SELECT googleknowledge_occupation, year, MAX(occupation_instances)
  FROM (SELECT googleknowledge_occupation, year, COUNT(googleknowledge_occupation) AS occupation_instances
  FROM daily_show_guests
  GROUP BY googleknowledge_occupation, year)
  GROUP BY year
  ORDER BY year;"
end

# def profession
#   "SELECT googleknowledge_occupation, year, COUNT(googleknowledge_occupation)
#   FROM daily_show_guests
#   GROUP BY googleknowledge_occupation, year
#   HAVING googleknowledge_occupation = 'actor';"
# end

def most_popular_profession
  "SELECT googleknowledge_occupation, COUNT(googleknowledge_occupation) FROM daily_show_guests GROUP BY googleknowledge_occupation ORDER BY COUNT(googleknowledge_occupation) DESC LIMIT 1;"
end

def guest_named_bill
  "SELECT guest FROM daily_show_guests WHERE guest LIKE '%Bill%';"
end

def patrick_stewart_appearances
  "SELECT show FROM daily_show_guests WHERE guest = 'Patrick Stewart'"
end

def year_with_most_guests
  "SELECT year, COUNT(guest) FROM daily_show_guests GROUP BY year ORDER BY count(guest) DESC LIMIT 1"
end

def most_pop_category_each_year
  "SELECT category, year, MAX(category_instances)
  FROM (SELECT category, year, COUNT(category) AS category_instances
  FROM daily_show_guests
  GROUP BY category, year)
  GROUP BY year
  ORDER BY year;"
end
