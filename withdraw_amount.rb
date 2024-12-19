module WithdrawAmount
  def withdraw_amount(customer_id, withdrawal_amount, to_customer = "Bank")
    customer_id = customer_id.to_i
    if (withdrawal_amount > 0)
      if $customer_account_balance[customer_id][:account_balance] >= withdrawal_amount
        # Update the account balance
        $customer_account_balance[customer_id][:account_balance] -= withdrawal_amount
        puts "Withdrew #{withdrawal_amount} from account number #{$customer_account_balance[customer_id][:account_number]}. New balance: #{$customer_account_balance[customer_id][:account_balance]}"
       
        # https://stackoverflow.com/questions/11090451/format-the-date-using-ruby-on-rails
        # withdraw_time = Time.now
        transaction_id = {
          from_customer: customer_id,
          to_customer: to_customer,
          status: "Withdrawn",
          message: "Success",
          amount: withdrawal_amount,
          # time: withdraw_time
        }
        $transactions[$transaction_id] = transaction_id
        $transaction_id += 1
      else
        puts "Insufficient balance!"
        # Log failed transaction
        transaction_id = {
          from_customer: customer_id,
          to_customer: to_customer,
          status: "Withdraw Failed",
          message: "Insufficient balance",
          amount: withdrawal_amount,
          # time: withdraw_time
        }
        $transactions[$transaction_id] = transaction_id
        $transaction_id += 1
      end
    else
      puts "Withdrawal amount must be greater than zero."
    end
  end
end
