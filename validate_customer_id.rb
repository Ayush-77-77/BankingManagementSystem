module ValidateCustomerId
  def validate_customer_id(customer_id)
    # https://stackoverflow.com/questions/26013930/how-to-force-the-input-of-a-variable-to-be-an-integer-in-ruby
    isValid = false
    begin
      customer_id = Integer(customer_id)
        isValid = true
    rescue 
      puts 'Not an integer ! Please try again to register with a valid customer id'
      isValid =  false
    end
    isValid # return value
  end
  
  def validate_customer_id_already_exist(customer_id)
      isValid = false
      begin
        customer_id = Integer(customer_id)
        if $customer_details.key?(customer_id)
          puts "Customer id is already exits! Please enter a unique customer id"
          isValid = false
        else
          isValid = true
        end
      rescue 
        puts 'Not an integer ! Please try again to register with a valid customer id'
        isValid =  false
      end
      isValid # return value
  end
end
