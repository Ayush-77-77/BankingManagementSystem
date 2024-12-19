module TransactionHisotry 
  def transaction_history(customer_id)
    if $customer_details.empty?
      account_details = $customer_details[customer_id]
      puts "-"*40
      puts "Customer ID     : #{customer_id}"
      puts "Account Number  : #{account_details[:account_number]}"
      puts "Full Name       : #{account_details[:full_name]}"
      puts "Account Balance : #{@account_transactions[customer_id][:account_balance]}"
      puts "-"*40
      puts "-"*40
      puts "\tstatus\t|\tMessage\t|\tFrom\t|\tTo\t|\tAmount"
      puts "-"*40
        transactions_of_customer_id = $transactions.select do |transaction_id, transaction|
          # puts "Checking transaction #{transaction_id}: #{transaction}"
          transaction[:to_customer] == customer_id || transaction[:from_customer] == customer_id
        end
      # p transactions_of_customer_id
    
        transactions_of_customer_id.each do |transaction_id, values|
        puts "\t#{values[:status]}\t|\t#{values[:message]}\t|\t#{values[:from_customer]}\t|\t#{values[:to_customer]}\t|\t#{values[:amount]}"
        end
    else
      puts "No History Found"
    end
    
  end
end