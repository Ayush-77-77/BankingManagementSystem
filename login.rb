

class Login
  def authentication?(email, password)
    if (email == "test@gmail.com" && password == "test")
      return true
    else
      return false
    end
  end 
end

