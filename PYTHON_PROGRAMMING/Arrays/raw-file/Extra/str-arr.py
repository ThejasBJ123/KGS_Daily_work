# WAP to create a user-defined string array. 

def string_array():
    l1 = []
    while True:
        val = input("Enter a value (leave empty to finish): ")
        if val == "":
            return l1
        l1.append(val)

print("Enter values into the array to be created...")
arr1 = string_array()
print("The created array is:", arr1)