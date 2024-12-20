class FundTransfer
  include ValidateCustomerId
  include SearchCustomer
  include WithdrawAmount
  include DepositAmount

  def fund_transfer
    # Customer ID of sender
    print "Enter the sender Customer Id: "
    from_customer_id = gets.chomp.to_i

    # Validate sender's customer ID
    if $customer_details.key?(from_customer_id)
      sender_details = search_customer_details(from_customer_id) # Store customer details
      return if sender_details == false # If the sender's account was not found, stop further processing.

      # Customer ID of receiver
      print "Enter the receiver Customer Id: "
      to_customer_id = gets.chomp.to_i

      # Validate receiver's customer ID
      if $customer_details.key?(to_customer_id)
        receiver_details = search_customer_details(to_customer_id) # Store customer details
        if sender_details == receiver_details
          puts "Sender and Receiver details are same"
          return
        end
        return if receiver_details == false 

        print "Enter the transfer amount: "
        transfer_amount = gets.chomp.to_f

        if transfer_amount <= 0
          puts "Transfer amount must be greater than zero."
        elsif withdraw_amount(from_customer_id, transfer_amount,$customer_account_details[to_customer_id][:account_number]) && deposit_amount(to_customer_id, transfer_amount,$customer_account_details[to_customer_id][:account_number])
          puts "Transfer funds #{transfer_amount} from account number #{$customer_account_details[from_customer_id][:account_number]} to #{$customer_account_details[to_customer_id][:account_number]}."
          puts "New balance: #{$customer_account_details[from_customer_id][:account_balance]}"
          puts "Transfer successful!"
        else
          puts "Transaction Unsuccesfull."
        end
      else
        puts "Receiver Customer ID is not registered."
      end
    else
      puts "Sender Customer ID is not registered."
    end
  end
end