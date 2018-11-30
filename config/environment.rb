require 'bundler'
Bundler.require
require_relative '../lib/queries'
# Setup a DB connection here

DB=SQLite3::Database.new( "./db/test_database.db" )
