# 3.	WAP to find the smallest element present in the given array along with its index.

def createIntarray():
    l1 = []
    while True:
        try:
            n = int(input("Enter a num: "))
            l1.append(n)
        except Exception:
            return l1

def findMinElement(arr):
    maxele = 2 ** 31
    maxeleind = 0

    for i in range(1, len(arr)):
        if arr[i] < maxele:
            maxele = arr[i]
            maxeleind = i
    return maxele, maxeleind

print("Enter an array to be created (enter any non-number to stop)...")
arr = createIntarray()
print("The created array is:", arr)

resele, resind = findMinElement(arr)
print("The smallest element is:", resele, "found at index:", resind)
