# Merging two different array without using 3rd variable

def createIntarray():
    l1 = []
    while True:
        try:
            val = int(input("Enter a Value:   "))
            l1.append(val)
        except Exception as e :
            return l1
            
def mergeAscarray2(arr1, arr2):
    for j in arr2:
        i = 0
        while i < len(arr1) and j > arr1[i]:
            i += 1
        arr1.insert(i, j)


print("Enter a elements for array1 in Ascending order: ")
arr1 = createIntarray()
print("The created array1 is:", arr1)

print("Enter a elements for array2 in Ascending order: ")
arr2 = createIntarray()
print("The created array2 is:", arr2)

mergeAscarray2(arr1, arr2)
print("Merged array is: ", arr1)