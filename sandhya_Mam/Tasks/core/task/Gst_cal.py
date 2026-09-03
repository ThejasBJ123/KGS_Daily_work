# GST Calculator:

# Different products require GST calculation.
# Create a function that accepts price and GST percentage.
# Return the final amount.

def cal_gst(price, gst_p):
    gst_a=(price*gst_p)/100
    final=gst_a+price

    return final


p=int(input(" enter the price of the product : "))
g=int(input(" enter the gst percentage: "))

amount=cal_gst(p,g)
print("final amount: ", amount)