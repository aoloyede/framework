require 'date' 
require 'pry'
require 'yaml'


file = File.open 'people_data.yml'

people_data = YAML::load(file)

binding.pry