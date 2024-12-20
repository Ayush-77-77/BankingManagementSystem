module TransactionHisotry 
  def transaction_history(customer_id)
    customer_id = customer_id.to_i
    if $customer_details.key?(customer_id)
      account_details = $customer_details[customer_id]
      account_number = $customer_account_details[customer_id][:account_number]
      account_balance = $customer_account_details[customer_id][:account_balance]
      puts "-" * 40
      puts "Customer ID     : #{customer_id}"
      puts "Account Number  : #{account_number}"
      puts "Full Name       : #{account_details[:full_name]}"
      puts "Account Balance : #{account_balance}"
      puts "-" * 125
      puts "-" * 125
      print "     Status".ljust(30)
      print "     Message".ljust(30)
      print "     From".ljust(20)
      print "     To".ljust(20)
      print "     Amount".ljust(20)
      # puts "    Status    |     Message    |    From    |   To   |   Amount   |     Time  "
      puts
      puts "-" * 125

      # Select transactions related to the given customer
      transactions_of_customer_id = $transactions.select do |transaction_id, transaction|
      transaction[:from_customer] == customer_id || transaction[:to_customer] == customer_id
      end
      if transactions_of_customer_id.empty?
          puts "No transactions found for this customer."
      else
            transactions_of_customer_id.each do |transaction_id, values|
              print "   #{values[:status]}".ljust(30)
              print "   #{values[:message]}".ljust(30)
              print "   #{values[:from_customer]}".ljust(20)
              print "   #{values[:to_customer]}".ljust(20)
              print "   #{values[:amount]}".ljust(20)
              print "   #{values[:time]}".ljust(20)
              puts
              puts "-"*125
            end
      end
    else
    puts "No customer found with ID #{customer_id}."
    end
  end
end