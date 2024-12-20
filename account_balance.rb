module AccountBalance
  def account_balance(customer_id)
    customer_id = customer_id.to_i
    account_details = $customer_details[customer_id]  
    puts "-"*40      
    puts "Customer ID     : #{customer_id}"
    puts "Account Number  : #{$customer_account_details[customer_id][:account_number]}"
    puts "Full Name       : #{account_details[:full_name]}"
    puts "Age             : #{account_details[:age]}"
    puts "Phone Number    : #{account_details[:phone]}"
    puts "Aadhar Card     : #{account_details[:aadhar_card]}"
    # puts "PAN Card        : #{account_details[:pan_card]}"
    puts "Address         : #{account_details[:address]}"
    puts "-" * 40
    puts "Account Balance : #{$customer_account_details[customer_id][:account_balance]}"
    puts "-" * 40
  end
end
