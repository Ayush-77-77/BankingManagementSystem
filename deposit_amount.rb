module DepositAmount
  def deposit_amount(customer_id, deposit_amount, from_customer = "self") 
    customer_id = customer_id.to_i
    if deposit_amount > 0
      # Update the account balance
      $customer_account_balance[customer_id][:account_balance] += deposit_amount
      puts "Deposited #{deposit_amount} into account number #{customer_id}. New balance: #{$customer_account_balance[customer_id][:account_balance]}"
      
      # Log the transaction
      transaction_id = {
        from_customer: from_customer, # No sender for deposits
        to_customer: customer_id,
        status: "Deposited",
        message: "",
        amount: deposit_amount
      }
      $transactions[$transaction_id] = transaction_id
      $transaction_id += 1
    else
      puts "Deposit amount must be greater than zero."
    end
  end
end
