
# transaction = [ 1200, -500, 3000, -800, 4500, -200, 700]

# -use filter function + lamdba to separate to debit tracsaction
# - use map function and lambada to add to 10 % cashback to credits above to 2000
# - display the final traction report 
# -  


# outer transaction anlayer, 

def transaction_analyzer(transactions):
    def calculate_balance():
        return sum(transactions)

    credits = list(filter(lambda x: x > 0, transactions))

   
    debits = list(filter(lambda x: x < 0, transactions))

    credits_after_cashback = list(
        map(lambda x: x * 1.10 if x > 2000 else x, credits)
    )

    print("===== BANK TRANSACTION REPORT =====")

    print("\nCredit Transactions:")
    print(credits)

    print("\nDebit Transactions:")
    print(debits)

    print("\nCredits After Cashback:")
    print(credits_after_cashback)

    print("\nFinal Balance:")
    print(calculate_balance())

transactions=[]
i=0
while (i<=4):
    n=int(input("Enter the num: "))
    transactions.insert(i,n)
    i=i+1
print(transactions)

# transactions = [1200, -500, 3000, -800, 4500, -200, 700]

transaction_analyzer(transactions)