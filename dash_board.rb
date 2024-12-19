require_relative 'validate_customer_id'
require_relative 'search_customer'
require_relative 'customer_registration'
require_relative 'all_customer_list'
require_relative 'transactions'
require_relative 'fund_transfer'
class DashBoard
  include SearchCustomer
  include ValidateCustomerId
  def dash_board_services
    while(true)
      puts "-"*40
      puts "1. Customer Registration"
      puts "2. All Customer list"
      puts "3. Search Customer"
      puts "4. Transactions"
      puts "5. Fund Transfer"
      puts "6. Exit"
      puts "-"*40
      print "Please enter the value (1 to 5) : " 
      service_number = gets.chomp  
      puts "-"*40
      go_to_service(service_number)
    end
  end
  
  def go_to_service(service_number)
      case service_number
      when '1'
        CustomerRegistration.new.customer_registration()
      when '2'
       AllCustomerList.new.display_all_customers()
      when '3'
        puts "-"*40
        print "Enter the customer id : "
        customer_id = gets.chomp
        # checking if the customer id has a valid input or not - calling module method
        search_customer_details(customer_id) if validate_customer_id(customer_id)  
        puts "-"*40
      when '4'
       Transactions.new.transaction_services()
      when '5'
        FundTransfer.new.fund_transfer
      when '6'
        exit()
      else
        puts "Please enter a valid input"
      end
     
  end
end