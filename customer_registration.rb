require_relative 'validate_customer_id'
require_relative 'edge_cases'
require 'time'
  $customer_details = {}
$customer_account_balance = {}

class CustomerRegistration
include ValidateCustomerId 
include EdgeCases
def customer_registration
  puts "Enter the details for Account creation"  
  puts "-"*40
  print "Enter customer id : "
  customer_id = gets.chomp
  if (customer_id_already_exist?(customer_id))
    customer_id = Integer(customer_id)
    begin
        print "Full Name : "
        full_name = gets.chomp
        raise "Name can not be empty" unless is_name_correct?(full_name)

        print "Age : "
        age = gets.chomp.to_i
        raise "Not a valid age! Please try again" unless is_age_correct?(age)
        
        print "Phone number : "
        phone_number = gets.chomp
        raise "Not a valide phone number! Please try again" unless is_phone_number_correct?(phone_number)

        print "Aadhar Card Number : "
        aadhar_card = gets.chomp
        raise "Not a valid Aadhar number! Please try again" unless is_aadhar_correct?(aadhar_card)
        # print "Pan Card Number : "
        # pan_card = gets.chomp
        print "Full Address : "
        address = gets.chomp
        raise "Address can not be empty or blank! Please try again " if is_address_correct?(address)
         # calling account number generation  
        account_number = account_number_generation()  
        
        # https://stackoverflow.com/questions/11090451/format-the-date-using-ruby-on-rails
        
        acc_creation_time = Time.now

        acc_creation_time = Time.now
        customer_raw_data = {
          customer_id: customer_id,
          account_number: account_number,
          full_name: full_name,
          age: age,
          phone: phone_number,
          aadhar_card: aadhar_card,
          # pan_card: pan_card,
          address: address,
          acc_creation_time: acc_creation_time
        }
        
        $customer_details[customer_id] = customer_raw_data
        $customer_account_balance[customer_id]={
          account_number: account_number,
          account_balance: 0
        }

        puts "-"*40
        puts "Account Created Successfully with the customer id #{customer_id} and the account number #{account_number}"
        puts "-"*40
    rescue StandardError => e
        puts "Error : #{e}"
    end

  end
end

  def account_number_generation()
    #https://stackoverflow.com/questions/34565/how-do-i-generate-a-random-10-digit-number-in-ruby
    account_number = '%010d' % rand(5 ** 10)

    #still need to work on validation of an account number
    return account_number
  end

end