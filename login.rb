require_relative 'employee_authentication'
require_relative 'dash_board'
require_relative 'customer_registration'
require_relative 'all_customer_list'
require_relative 'search_customer'
require_relative 'transactions'
require_relative 'validate_customer_id'
require_relative 'withdraw_amount'
require_relative 'deposit_amount'


# start of a program
email = "test@gmail.com"
password = "test"
if(EmployeeAuthentication.new.authentication?(email, password))
 DashBoard.new.dash_board_services()
else
  puts "Email or password is wrong"
end
