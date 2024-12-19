require_relative 'validate_customer_id'
require_relative 'validate_customer_id'
require_relative 'withdraw_amount'
require_relative 'deposit_amount'

class FundTransfer
  include ValidateCustomerId
  include SearchCustomer
  include WithdrawAmount
  include DepositAmount
    def fund_transfer
      
      # customer id of sender
      print  "Enter the sender Customer Id : "
      from_customer_id = gets.chomp
      if(validate_customer_id_already_exist(from_customer_id))
        from_customer_id = search_customer_details(from_customer_id)
        # customer id of receiver
        print  "Enter the receiver Customer Id : "
        to_customer_id = gets.chomp.to_i
        if(validate_customer_id_already_exist(to_customer_id))
          to_customer_id = search_customer_details(to_customer_id)
          print "Enter the transfer amount : "
          transfer_amount = gets.chomp.to_f
          
          if withdraw_amount(from_customer_id, transfer_amount)
              deposit_amount(to_customer_id, transfer_amount)
          end
        end
      end
    end
end