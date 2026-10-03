# Merging the two arrays with help of 3rd variable

def createIntarray():
    l1 = []
    while True:
        try:
            val = int(input("Enter a Value: "))
            l1.append(val)
        except Exception:
            return l1

def mergearrayAsc(arr1,arr2):
    res = []
    i, j = 0, 0
    n1, n2 = len(arr1), len(arr2)
    for k in range(0, (n1 + n2)):
        if i < n1 and j < n2:
            if arr1[i] < arr2[j]:
                res.append(arr1[i])
                i+=1
            else:
                res.append(arr2[j])
                j+=1
        else:
            if i < n1:
                res.append(arr1[i])
                i+=1
            else:
                res.append(arr2[j])
                j+=1
    return res
            
print("Enter a elements for array1 in Ascending order: ")
arr1=createIntarray()
print("The created array1 is:", arr1)

print("Enter a elements for array2 in Ascending order: ")
arr2=createIntarray()
print("The created array2 is:", arr2)

res = mergearrayAsc(arr1,arr2)
print("Merged array is: ",res)