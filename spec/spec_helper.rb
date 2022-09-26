require 'rspec'
require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'date'
require 'simplecov'

SimpleCov.start
require_relative 'attendee_spec'
require_relative 'auction_spec'
require_relative 'item_spec'