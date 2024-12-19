module TransactionHisotry 
  def transaction_history(customer_id)
    customer_id = customer_id.to_i
    if $customer_details.key?(customer_id)
      account_details = $customer_details[customer_id]
      account_balance = $customer_account_balance[customer_id][:account_balance]
      puts "-" * 40
      puts "Customer ID     : #{customer_id}"
      puts "Account Number  : #{account_details[:account_number]}"
      puts "Full Name       : #{account_details[:full_name]}"
      puts "Account Balance : #{account_balance}"
      puts "-" * 40
      puts "-" * 40
      puts "\tStatus\t|\tMessage\t|\tFrom\t|\tTo\t|\tAmount"
      puts "-" * 40

      # Select transactions related to the given customer
      transactions_of_customer_id = $transactions.select do |transaction_id, transaction|
      transaction[:from_customer] == customer_id || transaction[:to_customer] == customer_id
      end
      if transactions_of_customer_id.empty?
          puts "No transactions found for this customer."
      else
            transactions_of_customer_id.each do |transaction_id, values|
              puts "\t#{values[:status]}\t|\t#{values[:message]}\t|\t#{values[:from_customer]}\t|\t#{values[:to_customer]}\t|\t#{values[:amount]}"
            end
      end
    else
    puts "No customer found with ID #{customer_id}."
    end
  end
end