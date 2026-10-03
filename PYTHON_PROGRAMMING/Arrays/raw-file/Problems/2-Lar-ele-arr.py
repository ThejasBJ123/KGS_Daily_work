# 2.	WAP to find the largest element present in the given array along with its index.

def createIntarray():
    l1 = []
    while True:
        try:
            n = int(input("Enter a num:"))
            l1.append(n)
        except Exception as e:
            return l1

def findMaxElement(arr):
    maxele = -(2 ** 31)
    maxeleind = -1
    for i in range(0, len(arr)):
        if arr[i] > maxele:
            maxele = arr[i]
            maxeleind = i
    return maxele, maxeleind
print("Enter a array to be created...")
arr = createIntarray()
print("The created array is:",arr)

resele, resind = findMaxElement(arr)
print("The largest element is: ",resele,"found at index: ", resind)