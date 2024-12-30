require 'minitest/autorun'
require_relative '../deposit_amount' 
class TestDepositAmount < Minitest::Test
  def setup
    $customer_account_details = {
      1 => { account_balance: 1000 },
      2 => { account_balance: 500 }
    }
    $transactions = {}
    $transaction_id = 0
  end

  def test_successful_deposit
    deposit_module = Object.new
    deposit_module.extend(DepositAmount)

    
    result = deposit_module.deposit_amount(1, 200)
    assert_equal true, result
    assert_equal 1200, $customer_account_details[1][:account_balance]
    assert_includes $transactions.keys, 0  
    assert_equal "Deposited", $transactions[0][:status]
  end

  def test_invalid_deposit_amount
    deposit_module = Object.new
    deposit_module.extend(DepositAmount)

    # Test deposit with invalid amount (zero or negative)
    result = deposit_module.deposit_amount(1, 0)
    assert_equal false, result
    result = deposit_module.deposit_amount(1, -100)
    assert_equal false, result
  end

  def test_multiple_deposits
    deposit_module = Object.new
    deposit_module.extend(DepositAmount)

    # Test multiple deposits to the same account
    deposit_module.deposit_amount(1, 300)
    assert_equal 1300, $customer_account_details[1][:account_balance]

    deposit_module.deposit_amount(1, 500)
    assert_equal 1800, $customer_account_details[1][:account_balance]
  end
end
