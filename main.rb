require_relative 'login'
require_relative 'dash_board'
require_relative 'customer_registration'
require_relative 'all_customer_list'
require_relative 'search_customer'
require_relative 'transactions'
require_relative 'validate_customer_id'
require_relative 'withdraw_amount'
require_relative 'deposit_amount'
require_relative 'dummy_data'
print "\n\nEnter Login Email : "
email = gets.chomp
print "Passowrd : "
password = gets.chomp

if(Login.new.authentication?(email, password))
 DummyData.new.dummy_data()
 DashBoard.new.dash_board_services()
else
  puts "Email or password is wrong"
end
