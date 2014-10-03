require 'date'
require 'yaml'

class Person
    attr_accessor :dob, :first_name, :surname, :fullname, :emails, :phone_numbers
    
    def initialize(first_name, surname, dob)
        @dob = Date.parse(dob)
        @first_name = first_name
        @surname = surname 
        @emails = []
        @phone_numbers = []
    end 
    
    def fullname 
        "#{@first_name} #{@surname}"
    end  
    
    def add_email(e) 
        emails << e 
    end 
    
    def add_phone(n)
        phone_numbers << n
    end
    
    def remove_email(r)
        emails.delete_at r.to_i
    end
    
    def to_s
         "#{@first_name} #{@surname} was born on #{@dob}. \n Their email addresses are: #{@emails}. \n Their phone numbers are #{@phone_numbers}."
    end
end 

class AddressBook
    
    #sets and gets 
	attr_accessor :first_name, :surname, :dob, :yaml_file

	#instance variables 
	def initialize 
        @people =  []
	end  
    
    def add (p)
        @people << p 
    end
    
    def load_yaml (filename)
        @yaml_file = YAML.load(File.open("people_data.yml"))
        @yaml_file[:people].each do |details|
            person_o = Person.new(details[:fname], details[:surname], details[:dob])
            add(person_o)
        end
    end

    
    def list 
        @people.each_with_index do |a,i|
            puts "Entry " + (i+1).to_s + ": " + a.fullname
        end
    end
end 

class FamilyMember < Person
    attr_accessor :relationship 
    
    def initialize(first_name, surname, dob, relationship)
        super(first_name, surname, dob)
        @relationship = relationship
    end
end