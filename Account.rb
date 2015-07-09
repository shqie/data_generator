class Account
    def initialize (acct_num)
        # Instance variables
        # Constructor
        @acct_num = acct_num
    end

    def print_account_number
        puts "#{@acct_num}"
    end

    def get_account_number
        @acct_num
    end

end

# Make a new object of type account
# Ojects are created on the Heap

acct_1 = Account.new (12345678912)
acct_2 = Account.new (12345678913)

# Print the account numbers of each account.
acct_1.print_account_number
acct_2.print_account_number

# Get the account numbers for each account.
num_acct1 = acct_1.get_account_number()
num_acct2 = acct_2.get_account_number()

# Print the account number retrieved.
puts "#{num_acct1}"
puts "#{num_acct2}"

