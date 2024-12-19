require_relative 'validate_customer_id'
require 'time'
$customer_details = {}
$customer_account_balance = {}

class CustomerRegistration
include ValidateCustomerId 

def customer_registration
  puts "Enter the details for Account creation"  
  puts "-"*40
  print "Enter customer id : "
  customer_id = gets.chomp
  if (validate_customer_id_already_exist(customer_id))
    customer_id = Integer(customer_id)
    print "Full Name : "
    full_name = gets.chomp
    print "Age : "
    age = gets.chomp
    print "Phone number : "
    phone = gets.chomp
    print "Aadhar Card Number : "
    aadhar_card = gets.chomp
    print "Pan Card Number : "
    pan_card = gets.chomp
    print "Full Address : "
    address = gets.chomp
   # calling account number generation  
    account_number = account_number_generation()  
    acc_creation_time = Time.now
     # https://stackoverflow.com/questions/11090451/format-the-date-using-ruby-on-rails
    acc_creation_time = Time.now
    customer_raw_data = {
      customer_id: customer_id,
      account_number: account_number,
      full_name: full_name,
      age: age,
      phone: phone,
      aadhar_card: aadhar_card,
      pan_card: pan_card,
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
  end
end

  def account_number_generation()
    #https://stackoverflow.com/questions/34565/how-do-i-generate-a-random-10-digit-number-in-ruby
    account_number = '%010d' % rand(5 ** 10)

    #still need to work on validation of an account number
    return account_number
  end

end