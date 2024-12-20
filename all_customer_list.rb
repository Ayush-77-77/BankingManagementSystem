class AllCustomerList
  def display_all_customers
    if $customer_details.empty?
      puts "-"*40
      puts "\nNo account holders registered yet."
      puts "-"*40
    else
      puts "-"*40
      puts "\nRegistered Customer List:\n\n"
      puts "-"*40
      $customer_details.each do |customer_id, details|
        puts "Customer ID    : #{customer_id}"
        puts "Account Number : #{$customer_account_details[customer_id][:account_number]}"
        puts "Full Name      : #{details[:full_name]}"
        puts "Age            : #{details[:age]}"
        # puts "Phone Number   : #{details[:phone]}"
        # puts "Aadhar Card    : #{details[:aadhar_card]}"
        # puts "PAN Card       : #{details[:pan_card]}"
        # puts "Address        : #{details[:address]}"
        puts "-" * 40
      end
    end
  end
end