# WAP to create a user-defined Character array.

def character_array():
    l1 = []
    while True:
        val = input("Enter a value (leave empty to finish): ")
        if val == "":
            return l1
        l1.append(val[0])

print("Enter values into the array to be created...")
arr1 = character_array()
print("The created array is:", arr1)