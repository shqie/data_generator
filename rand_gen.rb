=begin
    
Script used to generate random fianncial data.
Author: nlq506
    
=end

require 'date'
require 'random_data'

# Generate random account number
 def random_account_number
     acct_num = rand(10**11).to_s.rjust(11, '1')
     return acct_num
 end

# Generate random Dates
 def random_date (start_year, end_year)
     random_year = rand(start_year..end_year)
     random_month = rand(01..12).to_s.rjust(2, '0')
     random_day = rand(01..30).to_s.rjust(2, '0')
     if random_day == 30 && random_month == 2
        random_day = rand(01..28).to_s.rjust(2, '0')
     end    
     rand_date = "#{random_year}" + "#{random_month}" + "#{random_day}"
     return rand_date
 end

# Generate random transactions ammount
 def random_ammount (min_amnt, max_amnt)
     random_ammt = (rand * (max_amnt - min_amnt) + min_amnt).round(2)
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
     array_merch_catg = [5732, 5944, 4829, 5678, 2314, 9487]
     merch_catg = array_merch_catg.sample
     return merch_catg
 end

# Generate purchase code
 def random_purchase_code
     prch_code = rand(1000..2000)
     return prch_code
 end

# Write to a text file
 def write_file
     file_name = "data/dataInput5"
     output_file = File.open(file_name,"w")
     
     min_ammt = 0.00
     max_ammt = 10000.00
     
     
     trnx_start_date = 2015
     trnx_end_end = 2015
     
     stmt_start_date = 2014
     stmt_end_date = 2015
     
     for i in 1..10
         acct_num = random_account_number()
         i_max = rand(2..10)
        
         for j in 1..i_max
            stmt_date = random_date(stmt_start_date,stmt_end_date)
            trnx_date = random_date(trnx_start_date,trnx_end_end)
            deb_cred_indicator = random_debit_credit_indicator()
            merch_catg = random_merchant_category()
            trnx_amnt = random_ammount(min_ammt,max_ammt)
            prch_code = random_purchase_code()
            output_file.puts "#{acct_num}" + "\001" + "#{stmt_date}" + "\001" + "#{trnx_date}" + "\001" + "#{deb_cred_indicator}" + "\001" + "#{merch_catg}" + "\001"  + "#{trnx_amnt}" +  "\001" + "#{prch_code}"
        end
    end 
    output_file.close
 end

# Print to console
 def print_to_console
 
     min_ammt = 0.00
     max_ammt = 10000.00
     
     trnx_start_date = 2015
     trnx_end_end = 2015
     
     stmt_start_date = 2014
     stmt_end_date = 2015
     
     for i in 1..10
         acct_num = random_account_number()
         i_max = rand(2..10)
        
         for j in 1..i_max
            stmt_date = random_date(stmt_start_date,stmt_end_date)
            trnx_date = random_date(trnx_start_date,trnx_end_end)
            deb_cred_indicator = random_debit_credit_indicator()
            merch_catg = random_merchant_category()
            trnx_amnt = random_ammount(min_ammt,max_ammt)
            prch_code = random_purchase_code()
            puts "#{acct_num}" + "\001" + "#{stmt_date}" + "\001" + "#{trnx_date}" + "\001" + "#{deb_cred_indicator}" + "\001" + "#{merch_catg}" + "\001"  + "#{trnx_amnt}" +  "\001" + "#{prch_code}"
        end
    end 
 end

write_file()
print_to_console()


