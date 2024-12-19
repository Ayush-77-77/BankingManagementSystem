module WithdrawAmount
  def withdraw_amount(customer_id, withdrawal_amount, to_customer = "self")
    customer_id = customer_id.to_i
    if (withdrawal_amount > 0)
      if $customer_account_balance[customer_id][:account_balance] >= withdrawal_amount
        # Update the account balance
        $customer_account_balance[customer_id][:account_balance] -= withdrawal_amount
        puts "Withdrew #{withdrawal_amount} from account number #{customer_id}. New balance: #{$customer_account_balance[customer_id][:account_balance]}"
        
        transaction_id = {
          from_customer: customer_id,
          to_customer: to_customer, # No receiver for withdrawals
          status: "Withdrawn",
          message: "",
          amount: withdrawal_amount
        }
        $transactions[$transaction_id] = transaction_id
        $transaction_id += 1
      else
        puts "Insufficient balance!"
        # Log failed transaction
        transaction_id = {
          from_customer: customer_id,
          to_customer: nil,
          status: "Failed",
          message: "Insufficient balance",
          amount: withdrawal_amount
        }
        $transactions[$transaction_id] = transaction_id
        $transaction_id += 1
      end
    else
      puts "Withdrawal amount must be greater than zero."
    end
  end
end
