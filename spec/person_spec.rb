require 'spec_helper'
require 'date'

describe "The Person class" do 
     it "should store basic details" do
        person = Person.new("Joe", "Bloggs", "1 Jan 1990")
        expected_date = Date.parse("1 Jan 1990")
         
        expect(person.dob).to eq(expected_date)
        expect(person.first_name).to eq("Joe")
        expect(person.surname).to eq("Bloggs")
        expect(person.fullname).to eq("Joe Bloggs")   
    end
    
    it "should store emails" do 
        person = Person.new("Joe", "Bloggs", "1 Jan 1990")
        expect(person.emails).to eq([])
        
        person.add_email "joe@foo.com"
        person.add_email "joe.bloggs@work.com"
        
        expect(person.emails).to eq(["joe@foo.com", "joe.bloggs@work.com"])
    end     
    
    it "should store phone numbers" do 
        person = Person.new("Joe", "Bloggs", "1 Jan 1990")
        expect(person.phone_numbers).to eq([])
        
        person.add_phone "07712345678"
        person.add_phone "02012345678"
        
        expect(person.phone_numbers).to eq(["07712345678", "02012345678"])
    end
    
    
    it "should remove emails" do 
        person = Person.new("Joe", "Bloggs", "1 Jan 1990")
        expect(person.emails).to eq([])
        
        person.add_email "joe.bloggs@work.com"
        person.add_email "joe.bloggs@wo.com"
        
        person.remove_email 0
        
        expect(person.emails).to eq(["joe.bloggs@wo.com"])   
    end       
    
    it "should list the details in string" do 
        person = Person.new("Joe", "Bloggs", "1 Jan 1990")
        expect(person.to_s).to eq("Joe Bloggs was born on 1990-01-01. \n Their email addresses are: []. \n Their phone numbers are [].")
    end 
end 
