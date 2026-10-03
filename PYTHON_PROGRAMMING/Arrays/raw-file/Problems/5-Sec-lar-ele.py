# 5.	WAP to find the second largest element along with the index in a given array.

def createIntarray():
    l1 = []
    while True:
        try:
            n = int(input("Enter a num: "))
            l1.append(n)
        except Exception as e:
            return l1

def findSecondLargestElement(arr):
    maxEle = -(2 ** 31)
    maxEleInd = -1
    secMaxEle = -(2 ** 31)
    secMaxEleInd = -1

    for i in range(0, len(arr)):
        if arr[i] > maxEle:
            secMaxEle, secMaxEleInd = maxEle, maxEleInd
            maxEle, maxEleInd = arr[i], i
        elif arr[i] != maxEle and arr[i] > secMaxEle:
            secMaxEle, secMaxEleInd = arr[i], i
    return [maxEle, maxEleInd, secMaxEle, secMaxEleInd]

print("Enter an array to be created (enter any non-number to stop)...")
arr = createIntarray()
print("The created array is:", arr)

res = findSecondLargestElement(arr)
print("Largest Element: ",res[0],"at index:",res[1])
print("Second largest Element: ",res[2],"at index:",res[3])