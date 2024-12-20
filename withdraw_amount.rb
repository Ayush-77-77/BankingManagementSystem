module WithdrawAmount
  def withdraw_amount(customer_id, withdrawal_amount, to_customer = "Bank")
    customer_id = customer_id.to_i
    if (withdrawal_amount > 0)
      if $customer_account_details[customer_id][:account_balance] >= withdrawal_amount
        # Update the account balance
        $customer_account_details[customer_id][:account_balance] -= withdrawal_amount
       
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
        return true
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
        return false
      end
    else
      puts "Withdrawal amount must be greater than zero."
      return false
    end
  end
end
