require_relative 'deposit_amount'
require_relative 'withdraw_amount'
require_relative 'fund_transfer'
require_relative 'account_balance'
require_relative 'validate_customer_id'
require_relative 'search_customer'
require_relative 'account_balance'
require_relative 'transaction_history'
$transaction_id = 1000
$transactions = {}

class Transactions
  include SearchCustomer
  include ValidateCustomerId
  include WithdrawAmount
  include DepositAmount
  include AccountBalance
  include TransactionHisotry
  def transaction_services
        puts "-"*80
        puts "1. Deposit"
        puts "2. Withdraw"
        puts "3. Account balance"
        puts "4. Transaction History"
        puts "5. Exit"
        puts "-"*80
        print "Enter the value (1 to 5) : "
        service_number = gets.chomp
        go_to_service(service_number)
  end

  def go_to_service(service_number)
    case service_number
    when '1'
      print "Enter the customer id : "
      customer_id = gets.chomp
        if (validate_customer_id(customer_id))
          if search_customer_details(customer_id)
            print "Enter the deposit amount : "
            deposit_amount = gets.chomp.to_f
            if deposit_amount(customer_id, deposit_amount)
              puts "Deposited #{deposit_amount} into account number #{$customer_account_details[customer_id.to_i][:account_number]}."
              puts "New balance: #{$customer_account_details[customer_id.to_i][:account_balance]}"
            end
          end
        end
    when '2'
      print "Enter the customer id : "
      customer_id = gets.chomp
        if (validate_customer_id(customer_id))
          if search_customer_details(customer_id)
            print "Enter the withdrawal amount : "
            withdraw_amount = gets.chomp.to_f
            if withdraw_amount(customer_id, withdraw_amount)
               puts "Withdrew #{withdraw_amount} from account number #{$customer_account_details[customer_id.to_i][:account_number]}."
               puts "New balance: #{$customer_account_details[customer_id.to_i][:account_balance]}"
            end
          end
        end
    when '3'
      print "Enter the customer id : "
      customer_id = gets.chomp
      if (validate_customer_id(customer_id))
        account_balance(customer_id)  if search_customer_details(customer_id)
      end
    when '4'
      puts "-"*40
      print "Enter the customer id : "
      customer_id = gets.chomp
      if (validate_customer_id(customer_id))
        transaction_history(customer_id)  if search_customer_details(customer_id)
      end
      puts "-"*40
    when '5'
      exit()
    else
      puts "Wrong Input!! Please try a valid input from 1 to 4"
    end 
  end
end