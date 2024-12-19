module WithdrawAmount
  def withdraw_amount(customer_id,withdrawal_amount)
      
    if $customer_account_balance[customer_id][:account_balance] >= withdrawal_amount
      $customer_account_balance[customer_id][:account_balance] -= withdrawal_amount
      
      puts "Withdrew #{withdrawal_amount} from account number #{customer_id}. New balance: #{$customer_account_balance[customer_id][:account_balance]}"
      
      transaction_id = {
        from_customer: customer_id,
        to_customer: nil,
        status: "withdraw",
        message: "",
        amount: withdrawal_amount
      }
      $transactions[$transaction_id] = transaction_id
      $transaction_id +=1
      return true
    else
      puts "Insufficient balance!"
      transaction_id = {
        from_customer: customer_id,
        to_customer: nil,
        status: "Failed",
        message: "Inssfficient Balance" 
      }
      $transactions[$transaction_id] = transaction_id
      $transaction_id +=1
      return false
    end
  end
end