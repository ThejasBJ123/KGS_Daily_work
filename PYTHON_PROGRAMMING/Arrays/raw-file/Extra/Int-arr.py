# WAP to create a user-defined integer array 

def createIntArray():
    l1 = []
    while True:
        try:
            num = int(input("Enter a num: "))
            l1.append(num)
        except Exception as e:
            return l1

print("Enter a values into the array to be created...")
arr = createIntArray()
print("The created arrays are: ", arr)









