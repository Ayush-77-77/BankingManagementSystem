module DepositAmount
  def deposit_amount(customer_id, deposit_amount) 
    $customer_account_balance[customer_id][:account_balance] += deposit_amount
    puts "Deposited #{deposit_amount} into account number #{customer_id}. New balance: #{$customer_account_balance[customer_id][:account_balance]}"
    transaction_id = {
      from_customer: customer_id,
      to_customer: nil,
      status: "Deposited",
      message: "",
      amount:deposit_amount
    }
    $transactions[$transaction_id] = transaction_id
    $transaction_id +=1
  end
end