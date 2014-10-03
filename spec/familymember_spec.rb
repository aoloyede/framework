require 'spec_helper'
require 'date'

describe "The FamilyMember" do 
     it "should say whether object is from either FamilyMember class or Person class" do
     	a = Person.new("Joe", "Bloggs", "1 Jan 1990")
     	alan = FamilyMember.new("Joe", "Bloggs", "1 Jan 1990", "father")

      	expect(alan.relationship).to eq("father")
      	expect(alan.is_a? Person)
    end 
end
