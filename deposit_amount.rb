module DepositAmount
  def deposit_amount(customer_id, deposit_amount, from_customer = "Bank") 
    customer_id = customer_id.to_i
    if deposit_amount > 0
      # Update the account balance
      $customer_account_details[customer_id][:account_balance] += deposit_amount
      
      # deposit time
      # deposit_time = Time.now
      # Log the transaction
      
      transaction_id = {
        from_customer: from_customer, 
        to_customer: customer_id,
        status: "Deposited",
        message: "Success",
        amount: deposit_amount,
        # time: deposit_time
      }
      $transactions[$transaction_id] = transaction_id
      $transaction_id += 1

      return true
    else
      puts "Deposit amount must be greater than zero."
      return false
    end
  end
 

 
end
