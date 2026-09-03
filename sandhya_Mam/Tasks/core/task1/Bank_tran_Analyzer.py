# transactions = [1200, -500, 3000, -800, 4500, -200, 700]

# Write a Python program that:

# Creates a nested function calculate_balance() inside transaction_analyzer().
# Uses filter() + lambda to separate credit transactions (positive values).
# Uses filter() + lambda to separate debit transactions (negative values).
# Uses map() + lambda to add 10% cashback to credit transactions above ₹2,000.
# Displays the final transaction report.

def transaction_analyzer(transactions):

    def calculate_balance():
        return sum(credits_after_cashback) + sum(debits)

    # Separate credit transactions
    credits = list(filter(lambda x: x > 0, transactions))

    # Separate debit transactions
    debits = list(filter(lambda x: x < 0, transactions))

    # Add 10% cashback to credits above 2000
    credits_after_cashback = list(
        map(lambda x: x * 1.10 if x > 2000 else x, credits)
    )

    print("\n===== BANK TRANSACTION REPORT =====")

    print("\nCredit Transactions:")
    print(credits)

    print("\nDebit Transactions:")
    print(debits)

    print("\nCredits After 10% Cashback:")
    print(credits_after_cashback)

    print("\nFinal Balance:")
    print(calculate_balance())


# Taking transactions from user
transactions = []

for i in range(7):
    n = int(input("Enter the transaction amount: "))
    transactions.append(n)

print("\nTransactions:", transactions)

# Calling function
transaction_analyzer(transactions)