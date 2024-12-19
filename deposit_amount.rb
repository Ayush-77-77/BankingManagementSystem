module DepositAmount
  def deposit_amount(customer_id, deposit_amount, from_customer = "Bank") 
    customer_id = customer_id.to_i
    if deposit_amount > 0
      # Update the account balance
      $customer_account_balance[customer_id][:account_balance] += deposit_amount
      puts "Deposited #{deposit_amount} into account number #{$customer_account_balance[customer_id][:account_number]}. New balance: #{$customer_account_balance[customer_id][:account_balance]}"
      
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
    else
      puts "Deposit amount must be greater than zero."
    end
  end
 

 
end
