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
        return if receiver_details == false

        print "Enter the transfer amount: "
        transfer_amount = gets.chomp.to_f

        if transfer_amount <= 0
          puts "Transfer amount must be greater than zero."
        elsif withdraw_amount(from_customer_id, transfer_amount,to_customer_id)
          if deposit_amount(to_customer_id, transfer_amount,from_customer_id)
            puts "Transfer successful!"
          else
            puts "Error in depositing the amount to the receiver."
          end
        else
          puts "Insufficient funds for withdrawal."
        end
      else
        puts "Receiver Customer ID is not valid."
      end
    else
      puts "Sender Customer ID is not valid."
    end
  end
end