require 'pry'
require 'date'

class Person 

	#sets and gets 
	attr_accessor :first_name, :surname, :fullname, :dob
	attr_reader :emails, :phone_numbers

	#instance variables 
	def initialize (first_name, surname, dob)
		@dob = dob
		@first_name =  first_name
		@surname = surname
		@fullname = @first_name + " " + @surname
        @emails = [] 
        @phone_numbers = []
	end  
    
    #instance methods 

    #when fulllname method is called it return with first name and surname together with a space 
    def fullname
        return @first_name + ' ' + @surname
    end 
    
    #adds an email address into array 
    def add_email(e)
        emails << e
    end 
    
    #adds a phone number into array 
    def add_phone(p)
        phone_numbers << p 
    end
    
    #removes or changes emails in array
    def remove_email (e)
        emails.delete_at e
    end 
    
    #removes or changes phone numbers in array
    def remove_phone (p)
        phone_numbers.delete_at p
    end 
    
    #prints out fullname, dob, lists emails and phone numbers on separate lines using the array method each 
    def print_details
        puts ""
        puts "#{@fullname}"
        puts "---------" ' '
        puts "Date of Birth:#{@dob}"
        
        puts ""
        puts "Email addresses:"
        @emails.each do |e|
            puts "- " + e.to_s
        end 
        
        puts ""
        puts "Phone Numbers:"
        @phone_numbers.each do |n|
            puts "- " + n.to_s
        end
    end
    
    #prints out the following sentence in string format 
    def to_s
        puts "Their name is #{@fullname} and their date of birth is #{@dob}.\n Their email addresses 
                are: #{@emails}.\n Their phone numbers are #{@phone_numbers}."
    end 
end 

#familymember class inherits from the person class and has an additional instance variable 
class FamilyMember < Person 
    
    #sets and gets 
    attr_accessor :relationship
    
    #instance variables 
    def initialize (relationship="relative")
        @relationship = relationship 
        super 
    end 
end 

class AddressBook
    
    #sets and gets 
	attr_accessor :first_name, :surname, :dob

	#instance variables 
	def initialize 
        @people =  []
	end  
    
    #instance methods 

    #adds person into array named people
    def add (p)
        @people << p 
    end
    
    #puts entry with array number + 1, semi colon and fullname 
    def list 
         @people.each_with_index do |a,i|
            puts "Entry " + (i+1).to_s + ": " + a.fullname
        end
    end  
end  
binding.pry 