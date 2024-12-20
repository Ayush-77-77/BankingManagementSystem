class DummyData
  def dummy_data
    dummy_customer_details = [
      {
        customer_id: 1234,
        full_name: "Ayush Gupta",
        age: 34,
        phone: "9876543210",
        aadhar_card: "123456789012",
        address: "Indore",
        acc_creation_time: "2023-03-25 08:30:00"
      },
      {
        customer_id: 5678,
        full_name: "Prince Rathore",
        age: 27,
        phone: "9876543211",
        aadhar_card: "234567890123",
        address: "Indore",
        acc_creation_time: "2023-07-10 14:00:00"
      },
      {
        customer_id: 9012,
        full_name: "Vivek Soni",
        age: 41,
        phone: "9876543212",
        aadhar_card: "345678901234",
        address: "Pune",
        acc_creation_time: "2022-11-15 10:45:00"
      },
      {
        customer_id: 3456,
        full_name: "Shivam Mahajan",
        age: 29,
        phone: "9876543213",
        aadhar_card: "456789012345",
        address: "Mumbai",
        acc_creation_time: "2024-01-05 16:20:00"
      }
    ]
    dummy_account_details = [{
          customer_id: 1234,
          account_number: 10023544455,
          account_balance: 0
        },
        {
          customer_id: 5678,
          account_number: 10045566555,
          account_balance: 0
        },
        {
          customer_id: 9012,
          account_number: 10045555457,
          account_balance: 0
        },
        {
          customer_id: 3456,
          account_number: 10025563565,
          account_balance: 0
        },
      ]
    load_dummy_data(dummy_customer_details, dummy_account_details)
  end
  def load_dummy_data(dummy_customer_details, dummy_account_details)
    dummy_customer_details.each do |customer|
      customer_raw_data = {
        customer_id: customer[:customer_id],
        full_name: customer[:full_name],
        age: customer[:age],
        phone: customer[:phone],
        aadhar_card: customer[:aadhar_card],
        address: customer[:address],
        acc_creation_time: customer[:acc_creation_time]
      }
      
      $customer_details[customer[:customer_id]] = customer_raw_data
      
    end
    dummy_account_details.each do |account|
      account_raw_data = {
        customer_id:  account[:customer_id],
        account_number: account[:account_number],
        account_balance: account[:account_balance]
      }
      $customer_account_details[account[:customer_id]] = account_raw_data
    end
  end
end