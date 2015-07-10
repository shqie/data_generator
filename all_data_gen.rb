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
 def random_date (start_year, end_year, start_month, end_month, start_day, end_day)
     random_year = rand(start_year..end_year)
     random_month = rand(start_month..end_month).to_s.rjust(2, '0')
     random_day = rand(start_day..end_day).to_s.rjust(2, '0')
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

# Popullate the array with random Account Numbers
def popullate_array(acct_numbers_array, number_acct_fields)
    for i in 1..number_acct_fields
        acct_num = random_account_number()
        acct_numbers_array.push(acct_num)
    end
    return acct_numbers_array
end

# Write to a Transactions file
def write_trxn_file(acct_numbers_array, number_trxn_fields)
    file_name = "data/transactions"
    output_file = File.open(file_name,"w")
    
    trxn_start_year = 2015
    trxn_end_year= 2015
    trxn_start_month = 4
    trxn_end_month = 9
    trxn_start_day = 01
    trxn_end_day = 21
    
    min_ammt = 0.00
    max_ammt = 10000.00
    
    for i in 1..number_trxn_fields
        acct_num = acct_numbers_array.sample
        trxn_date = random_date(trxn_start_year,trxn_end_year, trxn_start_month, trxn_end_month, trxn_start_day, trxn_end_day)
        deb_cred_indicator = random_debit_credit_indicator()
        merch_catg = random_merchant_category()
        trxn_amnt = random_ammount(min_ammt,max_ammt)
        prch_code = random_purchase_code()
        output_file.puts "#{acct_num}" + "\001" +  "#{trxn_date}" + "\001" + "#{deb_cred_indicator}" + "\001" + "#{merch_catg}" + "\001"  + "#{trxn_amnt}" +  "\001" + "#{prch_code}"
    end 
    output_file.close
end

# Write to a Statement file
def write_stmt_file(acct_numbers_array, number_stmt_fields)
    file_name = "data/statements"
    output_file = File.open(file_name,"w")
    
    stmt_start_year = 2015
    stmt_end_year= 2015
    stmt_start_month = 4
    stmt_end_month = 9
    stmt_start_day = 01
    stmt_end_day = 21
   
    for i in 1..number_stmt_fields
        stmt_date = random_date(stmt_start_year,stmt_end_year, stmt_start_month, stmt_end_month, stmt_start_day,stmt_end_day)
        acct_num = acct_numbers_array.sample
        output_file.puts "#{acct_num}" + "\001" + "#{stmt_date}" 
    end
    output_file.close
end

# Write to a Account file
def write_acct_file (acct_numbers_array, number_acct_fields)
    file_name = "data/accounts"
    output_file = File.open(file_name,"w")
    
    acct_numbers_array.each {|a| output_file.puts a}
    output_file.close
end

# Main method
def main
    acct_numbers_array = Array.new
    number_acct_fields = 10
    number_stmt_fields = 20
    number_trxn_fields = 20
    
    # Fill the array with random account IDs.
    acct_numbers_array = popullate_array(acct_numbers_array, number_acct_fields)
        
    # Write all the account number to a Account file.
    write_acct_file(acct_numbers_array, number_acct_fields)
    
    # Write random account numbers choosen from the Array
    #  togetehr with statement date to a Statement file.
    write_stmt_file(acct_numbers_array, number_stmt_fields)
    
    # Write all the data fields to a Transaction file.
    write_trxn_file(acct_numbers_array, number_trxn_fields)
end

main()

