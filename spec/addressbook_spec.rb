require 'spec_helper'
require 'date'

describe "The AddressBook  class" do 
    it "should load a yaml file into address book" do 
        book = AddressBook.new
        
        book.load_yaml("people_data.yml")
        
        expect(book.yaml_file[:people].length).to eq(3)
    end 
end