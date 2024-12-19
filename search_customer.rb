module SearchCustomer
  def search_customer_details(customer_id)
    if $customer_details.empty?
      puts "-"*80
      puts "No account with customer id #{customer_id} registered yet."
      puts "-"*80
      return false
    else
      account_details = $customer_details[customer_id.to_i]  
      if account_details
          puts "User Found"
          puts "-"*40      
          puts "Customer ID    : #{customer_id}"
          puts "Account Number : #{account_details[:account_number]}"
          puts "Full Name      : #{account_details[:full_name]}"
          puts "Phone Number   : #{account_details[:phone]}"
          puts "Age            : #{account_details[:age]}"
          puts "Aadhar Card    : #{account_details[:aadhar_card]}"
          puts "PAN Card       : #{account_details[:pan_card]}"
          puts "Address        : #{account_details[:address]}"
          puts "-" * 40
          return customer_id  
      else
          puts "Account not found!"
          return false
      end
    end    
  end
end