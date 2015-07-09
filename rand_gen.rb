
require 'date'
require 'random_data'

# Generate random account number
 def random_account_number
     acct_num = rand(10**11).to_s.rjust(11, '0')
     return acct_num
 end

# Generate random Dates
 def random_date
     random_year = rand(2014..2015)
     random_month = rand(01..12).to_s.rjust(2, '0')
     random_day = rand(01..30).to_s.rjust(2, '0')
     rand_date = "#{random_year}" + "#{random_month}" + "#{random_day}"
     return rand_date
 end

# Generate random transactions ammount
 def random_ammount
     min_ammt = 0.00
     max_ammt = 20000.00
     random_ammt = (rand * (max_ammt - min_ammt) + min_ammt).round(2)
     return random_ammt
 end

# Generate a random credit or debit indicator
 def random_debit_credit_indicator
     chars = ("C".."D").to_a
     debit_credit_ind = chars[rand(2)]
     return debit_credit_ind
 end

# Generate random merchante category
 def random_merchant_category
     merch_catg = rand(5000..7000)
     return merch_catg
 end

# Generate purchase code
 def random_purchase_code
     prch_code = rand(1000..2000)
     return prch_code
 end

# Write to a text file
 def write_file
     file_name = "data/output1"
     output_file = File.open(file_name,"w")
     
    for i in 1..10
        acct_num = random_account_number()
        deb_cred_indicator = random_debit_credit_indicator()
        trnx_date = random_date()
        trnx_amnt = random_ammount()
        stmt_date = random_date()
        merch_catg = random_merchant_category()
        prch_code = random_purchase_code()

        output_file.puts "#{acct_num}" + "/001" + "#{stmt_date}" + "/001" + "#{trnx_date}" + "/001" + "#{merch_catg}" + "/001" + "#{prch_code}" + "/001" + "#{deb_cred_indicator}" + "/001" + "#{trnx_amnt}"
    end
    output_file.close
 end

# Print to console
 def print_to_console
    for i in 1..10
        acct_num = random_account_number()
        deb_cred_indicator = random_debit_credit_indicator()
        trnx_date = random_date()
        trnx_amnt = random_ammount()
        stmt_date = random_date()
        merch_catg = random_merchant_category()
        prch_code = random_purchase_code()

        puts "#{acct_num}" + "/001" + "#{stmt_date}" + "/001" + "#{trnx_date}" + "/001" + "#{merch_catg}" + "/001" + "#{prch_code}" + "/001" + "#{deb_cred_indicator}" + "/001" + "#{trnx_amnt}"
    end
 end

write_file()
print_to_console()


