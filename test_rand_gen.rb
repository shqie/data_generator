

require 'date'
require 'random_data'

# Generate random account number
 def random_account_number
     acct_num = rand(10**11).to_s.rjust(11, '1')
     return acct_num
 end



# Generate random transactions ammount
 def random_ammount (min_amnt, max_amnt)
     random_ammt = (rand * (max_amnt - min_amnt) + min_amnt).round(2)
     return random_ammt
 end


# Write to a text file
 def write_file
     file_name = "data/test_data1"
     output_file = File.open(file_name,"a")
     
     min_ammt = 0.00
     max_ammt = 10000.00
          
     for i in 1..2
         acct_num = random_account_number()
         i_max = rand(2..10)
        
         for j in 1..2
            trnx_amnt = random_ammount(min_ammt,max_ammt)
            output_file.puts "#{acct_num}" + "\005" + "#{trnx_amnt}"
        end
    end 
    output_file.close
 end

# Print to console
 def print_to_console
     min_ammt = 0.00
     max_ammt = 10000.00
 
     for i in 1..2
         acct_num = random_account_number()
         i_max = rand(2..10)
        
         for j in 1..2
            trnx_amnt = random_ammount(min_ammt,max_ammt)
           puts "#{acct_num}" + "\005" + "#{trnx_amnt}"
        end
    end
 end

write_file()
print_to_console()
