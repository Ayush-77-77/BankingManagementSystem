require 'minitest/autorun'
require_relative '../withdraw_amount'  

class TestWithdrawAmount < Minitest::Test
  def setup
    $customer_account_details = {
      1 => { account_balance: 1000 },
      2 => { account_balance: 500 }
    }
    $transactions = {}
    $transaction_id = 0
  end

  def test_successful_withdrawal
    withdraw_module = Object.new
    withdraw_module.extend(WithdrawAmount)

    # Test withdrawal with valid amount
    result = withdraw_module.withdraw_amount(1, 200)
    assert_equal true, result
    assert_equal 800, $customer_account_details[1][:account_balance]
    assert_includes $transactions.keys, 0 # The transaction ID should be 0 in this case
    assert_equal "Withdrawn", $transactions[0][:status]
  end

  def test_insufficient_balance
    withdraw_module = Object.new
    withdraw_module.extend(WithdrawAmount)

    # Test withdrawal with insufficient balance
    result = withdraw_module.withdraw_amount(2, 600)
    assert_equal false, result
    assert_equal 500, $customer_account_details[2][:account_balance]
    assert_includes $transactions.keys, 0
    assert_equal "Withdraw Failed", $transactions[0][:status]
  end

  def test_invalid_withdrawal_amount
    withdraw_module = Object.new
    withdraw_module.extend(WithdrawAmountu)

    # Test withdrawal with invalid amount (zero or negative)
    result = withdraw_module.withdraw_amount(1, 0)
    assert_equal false, result
    result = withdraw_module.withdraw_amount(1, -100)
    assert_equal false, result
  end
end
