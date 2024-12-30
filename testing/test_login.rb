require 'minitest/autorun'
require_relative '../login' 
class TestLogin < Minitest::Test
  def setup
    @login = Login.new
  end

  def test_successful_authentication
    email = "test@gmail.com"
    password = "test"
    assert_equal true, @login.authentication?(email, password)
  end

  def test_failed_authentication_due_to_wrong_email
    email = "wrong@gmail.com"
    password = "test"
    assert_equal false, @login.authentication?(email, password)
  end

  def test_failed_authentication_due_to_wrong_password
    email = "test@gmail.com"
    password = "wrong"
    assert_equal false, @login.authentication?(email, password)
  end

  def test_failed_authentication_due_to_both_wrong
    email = "wrong@gmail.com"
    password = "wrong"
    assert_equal false, @login.authentication?(email, password)
  end
end
