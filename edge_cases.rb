module EdgeCases
  

  def is_phone_number_correct?(phone_number)
    # https://stackoverflow.com/questions/31808813/phone-number-validation-regex-in-rails
    valid_phone_number = /\A\d{10}\z/  
    return valid_phone_number.match?(phone_number)
  end

  def is_name_correct?(name)
    valid_name = /^[A-Za-z\s'-]+$/
    return valid_name.match?name
  end

  def is_age_correct?(age)
   return age.is_a?(Integer) && (age >= 18 && age < 100)
  end

  def is_aadhar_correct?(aadhar)
    valid_aadhar = /^\d{12}$/  # Matches 12 digits
    return valid_aadhar.match?(aadhar)
  end
  def is_address_correct?(address)
    return address.strip.empty?
  end

end