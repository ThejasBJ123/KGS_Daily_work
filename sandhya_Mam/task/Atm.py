Balance = 100000
correct_pin = "1234"

print("-----Welcome to KGS ATM-----")
print("Please Insert Your ATM Card")
print("Card Inserted Successfully.....")

print(".....Select your language.....")
print("\n 1. English \n 2. Kannada \n 3. Hindi \n")
lang_option = input("Enter your language option(1-3): ")

if lang_option == "1":
    user_pin = input("Enter 4 digit PIN: ")
    
    if user_pin == correct_pin:
        print("PIN is correct")
        print("\n 1. Withdrawal\n 2. Deposit\n 3. Balance Enquiry")
        acc_option = input("Enter option (1-3): ")
        
        if acc_option == "1":  # Withdrawal
            print("Select the type of Account....")
            print("\n 1. Savings\n 2. Current \n")
            account_type = input("Enter option(1-2): ")
            
            if account_type == "1":  # Savings Withdrawal
                amount = int(input("Enter the Amount to withdraw: "))
                
                # Check if amount is a multiple of 100
                if amount % 100 != 0:
                    print(".....Please enter the amount in multiples of 100 (e.g., 100, 500, 2000).....")
                elif amount <= Balance:
                    print("Processing......")
                    print(".....Please Wait......")
                    print("------Collect your cash------")
                    
                    Balance -= amount
                    
                    print("Do you want to see your Balance?")
                    print("1. Yes\n2. No")
                    see_balance = input("Enter option(1-2): ")

                    if see_balance == "1":
                        print("The Balance is: ", Balance)
                    print("Transaction is successful \nPlease Visit Again....")
                else:
                    print(".....Insufficient Bank Balance.....")
            else:
                print("Current Account Under Development.....")
                
        elif acc_option == "2":  # Deposit
            print("Select the type of Account....")
            print("\n 1. Savings\n 2. Current \n")
            account_type = input("Enter option(1-2): ")
            
            if account_type == "1":  # Savings Deposit
                depo_amount = int(input("Enter the Amount to Deposit: "))
                
                # Check if deposit amount is a multiple of 100
                if depo_amount % 100 == 0:
                    print("\n......Processing......")
                    print(".....Please Wait......")
                    print("------Amount Deposited------\n")
                    
                    Balance += depo_amount
                    print("Your latest Balance is: ", Balance)
                    print("\nTransaction is successful \nPlease Visit Again....\nRemember to Collect your Card\n")
                else:
                    print(".....Please deposit amounts in multiples of 100 only.....")
            else:
                print("Current Account Under Development.....")
                
        elif acc_option == "3":  # Balance Enquiry
            print("Your current account balance is: ", Balance)
            
        else:
            print("Please select a correct option...")
            
    else:
        print("Please enter correct PIN...")
else:
    print("Our ATM currently only supports English.")