"""
==============================================================================
  LeetCode & GeeksforGeeks — Complete Solutions
  Programming Language : Python

  ─── CONCEPTS & METHODS USED (from YOUR own notebooks) ───────────────────

  CONCEPT 1 : Strings
      - Characters accessed by index
      - ASCII manipulation  =>  ord() / chr()
      - Strings are immutable  =>  convert to list, modify, then join
      - Two-Pointer (i from left, j from right) for reversal / palindrome
      - Increment loop  :  nstr = s[i] + nstr   (prepend to build reverse)
      - Decrement loop  :  nstr = nstr + s[i]   (traverse from end)

  CONCEPT 2 : Arrays / Lists
      - Mutable, accessed by index, preserve insertion order
      - Two-Pointer technique  (i=0, j=len-1, meet in middle)
      - Frequency / occurrence using dictionary  { char : count }
      - ASCII frequency array  [0]*26
      - Sorting : Bubble Sort, Insertion Sort, Selection Sort, Merge Sort
      - Binary Search  (start, mid, end)  O(log n)
      - Prefix Sum (running sum) technique

  ─── METHOD SIGNATURE STYLE (exactly as in class) ──────────────────────
      def functionName(param):
          ...logic...
          return result

      result = functionName(input_value)
      print(result)
==============================================================================
"""

# =============================================================================
#                          S T R I N G S
# =============================================================================


# Q1. LeetCode 344 - Reverse String
# https://leetcode.com/problems/reverse-string/
"""
Problem:
    Write a function that reverses an array of characters in-place.
    Input  : s = ["h","e","l","l","o"]
    Output : ["o","l","l","e","h"]

Method Used: Two-Pointer Swap  (same as reversalswap() in reversal.ipynb)
    - i starts from 0  (left)
    - j starts from len-1  (right)
    - swap s[i] and s[j], move i++ and j-- until i >= j
"""

def reverseString(s):
    i, j = 0, len(s) - 1
    while i < j:
        s[i], s[j] = s[j], s[i]   # swap characters
        i += 1
        j -= 1
    return s

# Test
s = list("hello")
print("Q1  | Reverse String          :", reverseString(s))


# Q2. LeetCode 151 - Reverse Words in a String
# https://leetcode.com/problems/reverse-words-in-a-string/
"""
Problem:
    Given a string s, reverse the ORDER of words.
    Extra spaces between words should be removed.
    Input  : "  the sky is  blue  "
    Output : "blue is sky the"

Method Used: Word collection loop (from reversal.ipynb  reverse() function)
    - Append a trailing space so every word is followed by a space
    - Build each word char by char; when space is hit, prepend word to sentence
    - ASCII comparison to detect characters vs spaces
"""

def reverseWords(s):
    s = s + " "          # trailing space so last word is processed
    nsen  = ""           # new sentence (reversed word order)
    nwrd  = ""           # current word being built

    for i in range(0, len(s)):
        if s[i] != " ":
            nwrd = nwrd + s[i]             # collect word characters
        elif nwrd != "":
            if nsen == "":
                nsen = nwrd                # first word, no leading space
            else:
                nsen = nwrd + " " + nsen   # prepend to reverse order
            nwrd = ""
    return nsen

# Test
print("Q2  | Reverse Words           :", reverseWords("  the sky is  blue  "))


# Q3. GFG - Reverse Individual Words
# https://www.geeksforgeeks.org/reverse-individual-words/
"""
Problem:
    Reverse each individual word without reversing their order.
    Input  : "Sky is blue"
    Output : "ykS si eulb"

Method Used: Word collection + increment prepend loop
    - Collect characters; on space, the accumulated nwrd is already reversed
      because each char is prepended  =>  nwrd = s[i] + nwrd
"""

def reverseIndividualWords(s):
    s = s + " "
    nsen  = ""
    nwrd  = ""

    for i in range(0, len(s)):
        if s[i] != " ":
            nwrd = s[i] + nwrd      # prepend builds the word in reverse
        elif nwrd != "":
            if nsen == "":
                nsen = nwrd
            else:
                nsen = nsen + " " + nwrd
            nwrd = ""
    return nsen

# Test
print("Q3  | Reverse Individual Words:", reverseIndividualWords("Sky is blue"))


# Q4. GFG - Check if a String is Palindrome
# https://www.geeksforgeeks.org/check-if-a-string-is-palindrome-or-not/
"""
Problem:
    Check if a string is a palindrome (case-insensitive).
    Input  : "madam"   Output : True
    Input  : "hello"   Output : False

Method Used: filteration() + Two-Pointer  (from stringPlanindrome.ipynb)
    - Filter: keep only lowercase alphabets using ASCII  'A'<='Z' => +32
    - Two-Pointer: compare s[i] and s[j]; if mismatch => not palindrome
"""

def filteration(s):
    """Keep only alphanumeric chars and convert uppercase to lowercase."""
    nstr = ""
    for i in s:
        if "A" <= i <= "Z":
            nstr += chr(ord(i) + 32)       # uppercase to lowercase
        elif "a" <= i <= "z" or "0" <= i <= "9":
            nstr += i
    return nstr

def isPalindrome_str(s):
    s = filteration(s)
    i, j = 0, len(s) - 1
    while i < j:
        if s[i] != s[j]:
            return False
        i += 1
        j -= 1
    return True

# Test
print("Q4  | Palindrome (madam)       :", isPalindrome_str("madam"))
print("Q4  | Palindrome (hello)       :", isPalindrome_str("hello"))


# Q5. LeetCode 125 - Valid Palindrome
# https://leetcode.com/problems/valid-palindrome/
"""
Problem:
    A phrase is a palindrome if, after converting all uppercase letters to
    lowercase and removing all non-alphanumeric characters, it reads the
    same forward and backward.
    Input  : "A man, a plan, a canal: Panama"
    Output : True

Method Used: filteration() (ASCII) + Two-Pointer  (same as Q4)
"""

def isValidPalindrome(s):
    s = filteration(s)        # reuse filteration from above
    i, j = 0, len(s) - 1
    while i < j:
        if s[i] != s[j]:
            return False
        i += 1
        j -= 1
    return True

# Test
print("Q5  | Valid Palindrome         :", isValidPalindrome("A man, a plan, a canal: Panama"))


# Q6. GFG - Count Vowels in a String
# https://www.geeksforgeeks.org/program-count-vowels-string/
"""
Problem:
    Count the number of vowels (a, e, i, o, u) in a string.
    Input  : "Hello World"   Output : 3

Method Used: ASCII range check loop  (from String.ipynb  tolowerCase style)
    - Convert uppercase to lowercase using  ord() + 32
    - Check if character is a vowel
"""

def countVowels(s):
    count = 0
    for i in range(0, len(s)):
        ch = s[i]
        if "A" <= ch <= "Z":
            ch = chr(ord(ch) + 32)     # convert to lowercase
        if ch == "a" or ch == "e" or ch == "i" or ch == "o" or ch == "u":
            count += 1
    return count

# Test
print("Q6  | Count Vowels             :", countVowels("Hello World"))


# Q7. GFG - Count Digits and Characters in a String
# https://www.geeksforgeeks.org/count-number-digits-characters-string/
"""
Problem:
    Count digits and alphabetic characters separately.
    Input  : "Hello123World"
    Output : Digits = 3, Letters = 10

Method Used: ASCII comparison  ('0'<= ch <='9'  and  'a'<= ch <='z')
    (same approach as sumDigits() in String.ipynb)
"""

def countDigitsAndChars(s):
    digits  = 0
    letters = 0
    for i in range(0, len(s)):
        ch = s[i]
        if "0" <= ch <= "9":
            digits += 1
        elif ("a" <= ch <= "z") or ("A" <= ch <= "Z"):
            letters += 1
    return digits, letters

# Test
d, l = countDigitsAndChars("Hello123World")
print("Q7  | Digits =", d, ", Letters =", l)


# Q8. GFG - Count Special Characters in a String
# https://www.geeksforgeeks.org/count-special-characters-in-a-string/
"""
Problem:
    Count special characters (not alphanumeric, not space).
    Input  : "Hello@World#2025!"   Output : 3

Method Used: ASCII range exclusion logic (extension of Q7 logic)
"""

def countSpecialChars(s):
    count = 0
    for i in range(0, len(s)):
        ch = s[i]
        if not (("a" <= ch <= "z") or ("A" <= ch <= "Z") or
                ("0" <= ch <= "9") or ch == " "):
            count += 1
    return count

# Test
print("Q8  | Special Chars            :", countSpecialChars("Hello@World#2025!"))


# Q9. GFG - Count Words in a String
# https://www.geeksforgeeks.org/count-words-in-a-given-string/
"""
Problem:
    Count the number of words in a string (words separated by spaces).
    Input  : "Hello World Python"   Output : 3

Method Used: Word-boundary detection with trailing-space trick
    (same approach as reverse() from reversal.ipynb)
"""

def countWords(s):
    s = s + " "
    count = 0
    nwrd  = ""
    for i in range(0, len(s)):
        if s[i] != " ":
            nwrd = nwrd + s[i]
        elif nwrd != "":
            count += 1
            nwrd = ""
    return count

# Test
print("Q9  | Count Words              :", countWords("  Hello World Python  "))


# Q10. GFG - Toggle Case Using Bitwise Operators
# https://www.geeksforgeeks.org/toggle-case-string-using-bitwise-operators/
"""
Problem:
    Toggle case of every character in the string.
    'A' to 'a',  'a' to 'A'
    Input  : "ApPLE"   Output : "aPple"

Method Used: ASCII manipulation ord/chr +-32
    - Same as switchCase() in String.ipynb
"""

def toggleCase(s):
    l1 = list(s)
    for i in range(0, len(l1)):
        if "A" <= l1[i] <= "Z":
            l1[i] = chr(ord(l1[i]) + 32)   # uppercase to lowercase
        elif "a" <= l1[i] <= "z":
            l1[i] = chr(ord(l1[i]) - 32)   # lowercase to uppercase
    nstr = ""
    for i in l1:
        nstr = nstr + i
    return nstr

# Test
print("Q10 | Toggle Case              :", toggleCase("ApPLE"))


# Q11. GFG - Convert Uppercase to Lowercase and Vice Versa
# https://www.geeksforgeeks.org/convert-uppercase-to-lowercase-and-vice-versa/
"""
Problem:
    Convert all uppercase letters to lowercase and vice-versa.
    Input  : "AP 76ple"   Output : "ap 76PLE"

Method Used: ASCII  ord() / chr()  (toUpperCase + tolowerCase from String.ipynb)
"""

def convertCase(s):
    l1 = list(s)
    for i in range(0, len(l1)):
        if "A" <= l1[i] <= "Z":
            l1[i] = chr(ord(l1[i]) + 32)
        elif "a" <= l1[i] <= "z":
            l1[i] = chr(ord(l1[i]) - 32)
    nstr = ""
    for i in l1:
        nstr = nstr + i
    return nstr

# Test
print("Q11 | Convert Case             :", convertCase("AP 76ple"))


# Q12. GFG - Frequency of Characters in a String
# https://www.geeksforgeeks.org/frequency-of-characters-in-a-string/
"""
Problem:
    Count the frequency of each character in a string.
    Input  : "hello"
    Output : {'h':1, 'e':1, 'l':2, 'o':1}

Method Used: Dictionary frequency counting
    (same as isPangram() in stringPlanindrome.ipynb)
    - If char already in dict  => dict[char] += 1
    - Else                     => dict[char]  = 1
"""

def charFrequency(s):
    freq = {}
    for i in range(0, len(s)):
        if s[i] in freq:
            freq[s[i]] = freq[s[i]] + 1
        else:
            freq[s[i]] = 1
    return freq

# Test
print("Q12 | Char Frequency           :", charFrequency("hello"))


# Q13. GFG - Remove Duplicates from a String
# https://www.geeksforgeeks.org/remove-duplicates-from-a-given-string/
"""
Problem:
    Remove duplicate characters, keeping first occurrence.
    Input  : "geeksforgeeks"   Output : "geksfor"

Method Used: Dictionary seen-tracker + string building loop
"""

def removeDuplicates_str(s):
    seen = {}
    nstr = ""
    for i in range(0, len(s)):
        if s[i] not in seen:
            nstr = nstr + s[i]
            seen[s[i]] = 1
    return nstr

# Test
print("Q13 | Remove Duplicates        :", removeDuplicates_str("geeksforgeeks"))


# Q14. LeetCode 387 - First Unique Character in a String
# https://leetcode.com/problems/first-unique-character-in-a-string/
"""
Problem:
    Find the index of the first non-repeating character.
    Return -1 if none exists.
    Input  : "leetcode"   Output : 0
    Input  : "aabb"       Output : -1

Method Used: Dictionary frequency + index scan
"""

def firstUniqueChar(s):
    freq = {}
    for i in range(0, len(s)):
        if s[i] in freq:
            freq[s[i]] = freq[s[i]] + 1
        else:
            freq[s[i]] = 1

    for i in range(0, len(s)):
        if freq[s[i]] == 1:
            return i
    return -1

# Test
print("Q14 | First Unique Char Index  :", firstUniqueChar("leetcode"))


# Q15. GFG - First Repeated Character in a String
# https://www.geeksforgeeks.org/find-the-first-repeated-character-in-a-string/
"""
Problem:
    Find the first character that repeats in the string.
    Input  : "geeksforgeeks"   Output : 'e'

Method Used: Dictionary seen-set  (O(n) single pass)
"""

def firstRepeatedChar(s):
    seen = {}
    for i in range(0, len(s)):
        if s[i] in seen:
            return s[i]
        else:
            seen[s[i]] = 1
    return None

# Test
print("Q15 | First Repeated Char      :", firstRepeatedChar("geeksforgeeks"))


# =============================================================================
#                          A R R A Y S
# =============================================================================


# Q16. LeetCode 217 - Contains Duplicate
# https://leetcode.com/problems/contains-duplicate/
"""
Problem:
    Return True if any value appears at least twice; else return False.
    Input  : [1,2,3,1]   Output : True
    Input  : [1,2,3,4]   Output : False

Method Used: Dictionary frequency counting (same as charFrequency)
"""

def containsDuplicate(nums):
    freq = {}
    for i in range(0, len(nums)):
        if nums[i] in freq:
            return True
        else:
            freq[nums[i]] = 1
    return False

# Test
print("Q16 | Contains Duplicate       :", containsDuplicate([1, 2, 3, 1]))


# Q17. LeetCode 219 - Contains Duplicate II
# https://leetcode.com/problems/contains-duplicate-ii/
"""
Problem:
    Return True if there are two distinct indices i, j such that
    nums[i] == nums[j] and abs(i-j) <= k.
    Input  : nums = [1,2,3,1], k = 3   Output : True

Method Used: Dictionary storing last seen index
"""

def containsNearbyDuplicate(nums, k):
    last_index = {}
    for i in range(0, len(nums)):
        if nums[i] in last_index:
            if i - last_index[nums[i]] <= k:
                return True
        last_index[nums[i]] = i
    return False

# Test
print("Q17 | Contains Duplicate II    :", containsNearbyDuplicate([1, 2, 3, 1], 3))


# Q18. LeetCode 167 - Two Sum II (Sorted Input Array)
# https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
"""
Problem:
    Find two numbers in a 1-indexed sorted array that add up to target.
    Input  : numbers = [2,7,11,15], target = 9   Output : [1,2]

Method Used: Two-Pointer  (i from left, j from right) same as reversalswap()
    - If sum < target => move i right
    - If sum > target => move j left
    - If equal => found
"""

def twoSumII(numbers, target):
    i, j = 0, len(numbers) - 1
    while i < j:
        s = numbers[i] + numbers[j]
        if s == target:
            return [i + 1, j + 1]    # 1-indexed answer
        elif s < target:
            i += 1
        else:
            j -= 1
    return []

# Test
print("Q18 | Two Sum II               :", twoSumII([2, 7, 11, 15], 9))


# Q19. LeetCode 724 - Find Pivot Index
# https://leetcode.com/problems/find-pivot-index/
"""
Problem:
    Find the index where the sum of elements to its left equals the sum
    of elements to its right. Return -1 if no such index.
    Input  : [1,7,3,6,5,6]   Output : 3

Method Used: Prefix Sum (running total) technique
    - Calculate total sum first
    - Traverse and maintain left_sum; right_sum = total - left_sum - nums[i]
"""

def pivotIndex(nums):
    total = 0
    for i in range(0, len(nums)):
        total = total + nums[i]

    left_sum = 0
    for i in range(0, len(nums)):
        right_sum = total - left_sum - nums[i]
        if left_sum == right_sum:
            return i
        left_sum = left_sum + nums[i]
    return -1

# Test
print("Q19 | Pivot Index              :", pivotIndex([1, 7, 3, 6, 5, 6]))


# Q20. LeetCode 2574 - Left and Right Sum Differences
# https://leetcode.com/problems/left-and-right-sum-differences/
"""
Problem:
    Return array answer where answer[i] = |leftSum[i] - rightSum[i]|
    Input  : [10,4,8,3]
    Output : [15,1,11,22]

Method Used: Prefix sum from both directions
"""

def leftRightDifference(nums):
    n = len(nums)
    left_sum  = [0] * n
    right_sum = [0] * n

    for i in range(1, n):
        left_sum[i]  = left_sum[i - 1]  + nums[i - 1]

    for j in range(n - 2, -1, -1):
        right_sum[j] = right_sum[j + 1] + nums[j + 1]

    answer = [0] * n
    for i in range(0, n):
        diff = left_sum[i] - right_sum[i]
        if diff < 0:
            diff = -diff    # absolute value without using abs()
        answer[i] = diff

    return answer

# Test
print("Q20 | Left-Right Sum Diff      :", leftRightDifference([10, 4, 8, 3]))


# Q21. LeetCode 283 - Move Zeroes
# https://leetcode.com/problems/move-zeroes/
"""
Problem:
    Move all 0s to the end while maintaining order of non-zero elements.
    In-place, no extra array.
    Input  : [0,1,0,3,12]   Output : [1,3,12,0,0]

Method Used: Two-Pointer (slow pointer for write position)
    - j tracks the next write position for non-zero elements
    - After placing all non-zeros, fill remaining positions with 0
"""

def moveZeroes(nums):
    j = 0   # write pointer
    for i in range(0, len(nums)):
        if nums[i] != 0:
            nums[j] = nums[i]
            j += 1
    while j < len(nums):
        nums[j] = 0
        j += 1
    return nums

# Test
print("Q21 | Move Zeroes              :", moveZeroes([0, 1, 0, 3, 12]))


# Q22. GFG - Rotate Array by N Elements (Left Rotation)
# https://www.geeksforgeeks.org/problems/rotate-array-by-n-elements-1587115621/1
"""
Problem:
    Left rotate the array by d positions.
    Input  : arr = [1,2,3,4,5], d = 2   Output : [3,4,5,1,2]

Method Used: Three-Reverse technique (same reversal swap logic)
    - Reverse first d elements
    - Reverse remaining n-d elements
    - Reverse the whole array
"""

def reverseArr(arr, start, end):
    """Helper: reverse arr in-place from index start to end (Two-Pointer Swap)."""
    i, j = start, end
    while i < j:
        arr[i], arr[j] = arr[j], arr[i]
        i += 1
        j -= 1

def rotateLeft(arr, d):
    n = len(arr)
    d = d % n
    reverseArr(arr, 0, d - 1)
    reverseArr(arr, d, n - 1)
    reverseArr(arr, 0, n - 1)
    return arr

# Test
print("Q22 | Rotate Left by 2         :", rotateLeft([1, 2, 3, 4, 5], 2))


# Q23. LeetCode 189 - Rotate Array (Right Rotation)
# https://leetcode.com/problems/rotate-array/description/
"""
Problem:
    Right rotate array by k steps.
    Input  : nums = [1,2,3,4,5,6,7], k = 3   Output : [5,6,7,1,2,3,4]

Method Used: Three-Reverse technique
    - Reverse whole array
    - Reverse first k elements
    - Reverse remaining n-k elements
"""

def rotateRight(nums, k):
    n = len(nums)
    k = k % n
    reverseArr(nums, 0, n - 1)
    reverseArr(nums, 0, k - 1)
    reverseArr(nums, k, n - 1)
    return nums

# Test
print("Q23 | Rotate Right by 3        :", rotateRight([1, 2, 3, 4, 5, 6, 7], 3))


# Q24. GFG - Bubble Sort
# https://www.geeksforgeeks.org/problems/bubble-sort/1
"""
Problem:
    Sort array using Bubble Sort (ascending).
    Input  : [64,34,25,12,22,11,90]   Output : [11,12,22,25,34,64,90]

Method Used: Nested loop comparison + swap
    (exactly bubbleSortAsc() from 07_bubble_sort.ipynb)
"""

def bubbleSort(arr):
    n = len(arr)
    for i in range(0, n - 1):
        for j in range(0, n - 1 - i):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return arr

# Test
print("Q24 | Bubble Sort              :", bubbleSort([64, 34, 25, 12, 22, 11, 90]))


# Q25. GFG - Insertion Sort
# https://www.geeksforgeeks.org/problems/insertion-sort/1
"""
Problem:
    Sort array using Insertion Sort.
    Input  : [12,11,13,5,6]   Output : [5,6,11,12,13]

Method Used: Backward shifting loop (pick key; shift right; insert)
    (from 08_insertion_sort.ipynb)
"""

def insertionSort(arr):
    n = len(arr)
    for i in range(1, n):
        key = arr[i]
        j = i - 1
        while j >= 0 and arr[j] > key:
            arr[j + 1] = arr[j]
            j -= 1
        arr[j + 1] = key
    return arr

# Test
print("Q25 | Insertion Sort           :", insertionSort([12, 11, 13, 5, 6]))


# Q26. GFG - Selection Sort
# https://www.geeksforgeeks.org/problems/selection-sort/1
"""
Problem:
    Sort array using Selection Sort.
    Input  : [64,25,12,22,11]   Output : [11,12,22,25,64]

Method Used: Find minimum in unsorted portion; swap to front
    (from 06_selection_sort.ipynb)
"""

def selectionSort(arr):
    n = len(arr)
    for i in range(0, n - 1):
        min_idx = i
        for j in range(i + 1, n):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    return arr

# Test
print("Q26 | Selection Sort           :", selectionSort([64, 25, 12, 22, 11]))


# Q27. GFG - Merge Sort
# https://www.geeksforgeeks.org/problems/merge-sort/1
"""
Problem:
    Sort array using Merge Sort (Divide and Conquer).
    Input  : [38,27,43,3,9,82,10]   Output : [3,9,10,27,38,43,82]

Method Used: Recursive divide + two-pointer merge
    (from 13_merge_sort.ipynb)
"""

def mergeSortedArrays(left, right):
    result = []
    i, j   = 0, 0
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    while i < len(left):
        result.append(left[i])
        i += 1
    while j < len(right):
        result.append(right[j])
        j += 1
    return result

def mergeSort(arr):
    if len(arr) <= 1:
        return arr
    mid   = len(arr) // 2
    left  = mergeSort(arr[:mid])
    right = mergeSort(arr[mid:])
    return mergeSortedArrays(left, right)

# Test
print("Q27 | Merge Sort               :", mergeSort([38, 27, 43, 3, 9, 82, 10]))


# Q28. LeetCode 1480 - Running Sum of 1D Array
# https://leetcode.com/problems/running-sum-of-1d-array/description/
"""
Problem:
    Return the running (prefix) sum of an array.
    Input  : [1,2,3,4]   Output : [1,3,6,10]

Method Used: Prefix Sum - accumulate as we scan
"""

def runningSum(nums):
    result = [0] * len(nums)
    result[0] = nums[0]
    for i in range(1, len(nums)):
        result[i] = result[i - 1] + nums[i]
    return result

# Test
print("Q28 | Running Sum              :", runningSum([1, 2, 3, 4]))


# Q29. LeetCode 3005 - Count Elements with Maximum Frequency
# https://leetcode.com/problems/count-elements-with-maximum-frequency/description/
"""
Problem:
    Return the total number of elements that have the maximum frequency.
    Input  : [1,2,2,3,1,4]   Output : 4

Method Used: Dictionary frequency count, then scan for max
"""

def maxFrequencyElements(nums):
    freq = {}
    for i in range(0, len(nums)):
        if nums[i] in freq:
            freq[nums[i]] = freq[nums[i]] + 1
        else:
            freq[nums[i]] = 1

    max_freq = 0
    for key in freq:
        if freq[key] > max_freq:
            max_freq = freq[key]

    count = 0
    for key in freq:
        if freq[key] == max_freq:
            count += max_freq
    return count

# Test
print("Q29 | Max Frequency Elements   :", maxFrequencyElements([1, 2, 2, 3, 1, 4]))


# Q30. GFG - Frequency of Array Elements
# https://www.geeksforgeeks.org/problems/frequency-of-elements--111353/1
"""
Problem:
    Print frequency of each element in an array.
    Input  : [2,3,2,3,5]   Output : {2:2, 3:2, 5:1}

Method Used: Dictionary frequency counting (same as charFrequency)
"""

def frequencyOfElements(arr):
    freq = {}
    for i in range(0, len(arr)):
        if arr[i] in freq:
            freq[arr[i]] = freq[arr[i]] + 1
        else:
            freq[arr[i]] = 1
    return freq

# Test
print("Q30 | Frequency of Elements    :", frequencyOfElements([2, 3, 2, 3, 5]))


# Q31. GFG - Remove Duplicates from Sorted Array
# https://www.geeksforgeeks.org/problems/remove-duplicate-elements-from-sorted-array/1
"""
Problem:
    Remove duplicates from sorted array in-place; return new length.
    Input  : [1,1,2,2,3,4,4,5]   Output : 5

Method Used: Two-Pointer (j = write pointer, i = read pointer)
"""

def removeDuplicatesSorted(arr):
    if len(arr) == 0:
        return 0
    j = 0
    for i in range(1, len(arr)):
        if arr[i] != arr[j]:
            j += 1
            arr[j] = arr[i]
    return j + 1

# Test
arr_test = [1, 1, 2, 2, 3, 4, 4, 5]
k = removeDuplicatesSorted(arr_test)
print("Q31 | Remove Dup Sorted (GFG)  :", arr_test[:k])


# Q32. LeetCode 26 - Remove Duplicates from Sorted Array
# https://leetcode.com/problems/remove-duplicates-from-sorted-array/description/
"""
Problem:
    Same as Q31 but return just the count k.
    Input  : [0,0,1,1,1,2,2,3,3,4]   Output : 5

Method Used: Two-Pointer (write pointer j)
"""

def removeDuplicates(nums):
    if len(nums) == 0:
        return 0
    j = 0
    for i in range(1, len(nums)):
        if nums[i] != nums[j]:
            j += 1
            nums[j] = nums[i]
    return j + 1

# Test
nums_test = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
print("Q32 | Remove Dup Sorted (LC)   :", removeDuplicates(nums_test))


# Q33. GFG - Remove Duplicates from Unsorted Array
# https://www.geeksforgeeks.org/problems/remove-duplicates-from-unsorted-array4141/1
"""
Problem:
    Remove all duplicate elements from an unsorted array.
    Input  : [1,2,1,3,4,3,5]   Output : [1,2,3,4,5]

Method Used: Dictionary seen-tracker (same as removeDuplicates_str)
"""

def removeDuplicatesUnsorted(arr):
    seen   = {}
    result = []
    for i in range(0, len(arr)):
        if arr[i] not in seen:
            result.append(arr[i])
            seen[arr[i]] = 1
    return result

# Test
print("Q33 | Remove Dup Unsorted      :", removeDuplicatesUnsorted([1, 2, 1, 3, 4, 3, 5]))


# Q34. LeetCode 442 - Find All Duplicates in an Array
# https://leetcode.com/problems/find-all-duplicates-in-an-array/description/
"""
Problem:
    Find all elements that appear twice in array (1 <= nums[i] <= n).
    Input  : [4,3,2,7,8,2,3,1]   Output : [2,3]

Method Used: Dictionary frequency, collect those with count == 2
"""

def findDuplicates(nums):
    freq   = {}
    result = []
    for i in range(0, len(nums)):
        if nums[i] in freq:
            freq[nums[i]] = freq[nums[i]] + 1
        else:
            freq[nums[i]] = 1

    for key in freq:
        if freq[key] == 2:
            result.append(key)
    return result

# Test
print("Q34 | Find All Duplicates      :", findDuplicates([4, 3, 2, 7, 8, 2, 3, 1]))


# =============================================================================
#                  B I N A R Y   S E A R C H
# =============================================================================


# Q35. LeetCode 35 - Search Insert Position
# https://leetcode.com/problems/search-insert-position/description/
"""
Problem:
    Return index of target in sorted array; if not found, return index
    where it would be inserted to keep order.
    Input  : nums = [1,3,5,6], target = 5   Output : 2
    Input  : nums = [1,3,5,6], target = 2   Output : 1

Method Used: Binary Search  (from 09_binary_search.ipynb)
    - At end, start pointer is the insertion position
"""

def searchInsert(nums, target):
    start, end = 0, len(nums) - 1
    while start <= end:
        mid = (start + end) // 2
        if target == nums[mid]:
            return mid
        elif target < nums[mid]:
            end = mid - 1
        else:
            start = mid + 1
    return start    # insertion position

# Test
print("Q35 | Search Insert Position   :", searchInsert([1, 3, 5, 6], 2))


# Q36. LeetCode 34 - First and Last Position of Element
# https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
"""
Problem:
    Find starting and ending position of target in sorted array.
    Input  : nums = [5,7,7,8,8,10], target = 8   Output : [3,4]
    Input  : target = 6                            Output : [-1,-1]

Method Used: Binary Search twice
    - findFirst: bias left (when found, keep searching left)
    - findLast:  bias right (when found, keep searching right)
"""

def searchRange(nums, target):
    def findFirst(nums, target):
        start, end, result = 0, len(nums) - 1, -1
        while start <= end:
            mid = (start + end) // 2
            if target == nums[mid]:
                result = mid
                end = mid - 1     # keep searching left for first
            elif target < nums[mid]:
                end = mid - 1
            else:
                start = mid + 1
        return result

    def findLast(nums, target):
        start, end, result = 0, len(nums) - 1, -1
        while start <= end:
            mid = (start + end) // 2
            if target == nums[mid]:
                result = mid
                start = mid + 1   # keep searching right for last
            elif target < nums[mid]:
                end = mid - 1
            else:
                start = mid + 1
        return result

    return [findFirst(nums, target), findLast(nums, target)]

# Test
print("Q36 | First & Last Position    :", searchRange([5, 7, 7, 8, 8, 10], 8))


# Q37. GFG - Floor in a Sorted Array
# https://www.geeksforgeeks.org/problems/floor-in-a-sorted-array-1587115620/1
"""
Problem:
    Find the largest element in arr[] <= x  (floor value).
    Input  : arr = [1,2,8,10,12,19], x = 5   Output : 2 (value at floor index)

Method Used: Binary Search with floor tracking
"""

def floorInSortedArray(arr, x):
    start, end = 0, len(arr) - 1
    floor_idx  = -1
    while start <= end:
        mid = (start + end) // 2
        if arr[mid] == x:
            return mid
        elif arr[mid] < x:
            floor_idx = mid     # potential floor
            start = mid + 1
        else:
            end = mid - 1
    return floor_idx

# Test
arr_bs = [1, 2, 8, 10, 12, 19]
fi = floorInSortedArray(arr_bs, 5)
print("Q37 | Floor in Sorted Array    :", arr_bs[fi] if fi != -1 else -1)


# Q38. GFG - Ceil in a Sorted Array
# https://www.geeksforgeeks.org/problems/ceil-the-floor2802/1
"""
Problem:
    Find the smallest element in arr[] >= x  (ceil value).
    Input  : arr = [1,2,8,10,12,19], x = 5   Output : 8

Method Used: Binary Search with ceil tracking
"""

def ceilInSortedArray(arr, x):
    start, end = 0, len(arr) - 1
    ceil_idx   = -1
    while start <= end:
        mid = (start + end) // 2
        if arr[mid] == x:
            return mid
        elif arr[mid] > x:
            ceil_idx = mid      # potential ceil
            end = mid - 1
        else:
            start = mid + 1
    return ceil_idx

# Test
ci = ceilInSortedArray(arr_bs, 5)
print("Q38 | Ceil in Sorted Array     :", arr_bs[ci] if ci != -1 else -1)


# Q39. LeetCode 33 - Search in Rotated Sorted Array
# https://leetcode.com/problems/search-in-rotated-sorted-array/
"""
Problem:
    Search target in a rotated sorted array (no duplicates).
    Input  : nums = [4,5,6,7,0,1,2], target = 0   Output : 4

Method Used: Modified Binary Search - identify which half is sorted
    (extension of orderAgnosticBinarySearch from 09_binary_search.ipynb)
"""

def searchRotatedArray(nums, target):
    start, end = 0, len(nums) - 1
    while start <= end:
        mid = (start + end) // 2
        if nums[mid] == target:
            return mid

        # Left half is sorted
        if nums[start] <= nums[mid]:
            if nums[start] <= target < nums[mid]:
                end = mid - 1
            else:
                start = mid + 1
        # Right half is sorted
        else:
            if nums[mid] < target <= nums[end]:
                start = mid + 1
            else:
                end = mid - 1
    return -1

# Test
print("Q39 | Search Rotated Array     :", searchRotatedArray([4, 5, 6, 7, 0, 1, 2], 0))


# Q40. LeetCode 153 - Find Minimum in Rotated Sorted Array
# https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
"""
Problem:
    Find the minimum element in a rotated sorted array.
    Input  : [3,4,5,1,2]   Output : 1

Method Used: Binary Search - minimum is at the rotation pivot point
"""

def findMin(nums):
    start, end = 0, len(nums) - 1
    while start < end:
        mid = (start + end) // 2
        if nums[mid] > nums[end]:
            start = mid + 1     # min is in right half
        else:
            end = mid           # min is in left half (including mid)
    return nums[start]

# Test
print("Q40 | Min in Rotated Array     :", findMin([3, 4, 5, 1, 2]))


# Q41. LeetCode 162 - Find Peak Element
# https://leetcode.com/problems/find-peak-element/
"""
Problem:
    A peak element is greater than its neighbors. Return any peak index.
    Input  : nums = [1,2,3,1]   Output : 2

Method Used: Binary Search - move towards the higher neighbor
"""

def findPeakElement(nums):
    start, end = 0, len(nums) - 1
    while start < end:
        mid = (start + end) // 2
        if nums[mid] > nums[mid + 1]:
            end = mid           # peak is on left side (including mid)
        else:
            start = mid + 1    # peak is on right side
    return start

# Test
print("Q41 | Find Peak Element        :", findPeakElement([1, 2, 3, 1]))


# Q42. LeetCode 81 - Search in Rotated Sorted Array II
# https://leetcode.com/problems/search-in-rotated-sorted-array-ii/description/
"""
Problem:
    Same as Q39 but array may contain duplicates.
    Input  : nums = [2,5,6,0,0,1,2], target = 0   Output : True

Method Used: Modified Binary Search with duplicate handling
    - When nums[start] == nums[mid] == nums[end], shrink both ends
"""

def searchRotatedArrayII(nums, target):
    start, end = 0, len(nums) - 1
    while start <= end:
        mid = (start + end) // 2
        if nums[mid] == target:
            return True

        # Handle duplicates - cannot determine which side is sorted
        if nums[start] == nums[mid] == nums[end]:
            start += 1
            end   -= 1
        elif nums[start] <= nums[mid]:
            if nums[start] <= target < nums[mid]:
                end = mid - 1
            else:
                start = mid + 1
        else:
            if nums[mid] < target <= nums[end]:
                start = mid + 1
            else:
                end = mid - 1
    return False

# Test
print("Q42 | Search Rotated Array II  :", searchRotatedArrayII([2, 5, 6, 0, 0, 1, 2], 0))


# =============================================================================
#                  A R R A Y   B A S I C S
# =============================================================================


# Q43. HackerRank / HackerEarth - Reverse an Array
# https://www.hackerrank.com/challenges/reverse-array-c/problem
# https://www.hackerearth.com/practice/data-structures/arrays/1-d/practice-problems/algorithm/print-array-in-reverse/
"""
Problem:
    Print the given array in reverse order.
    Input  : [1,2,3,4,5]   Output : [5,4,3,2,1]

Method Used: Two-Pointer Swap (reversalswap from reversal.ipynb)
"""

def reverseArray(arr):
    i, j = 0, len(arr) - 1
    while i < j:
        arr[i], arr[j] = arr[j], arr[i]
        i += 1
        j -= 1
    return arr

# Test
print("Q43 | Reverse Array            :", reverseArray([1, 2, 3, 4, 5]))


# Q44. GFG - Perfect Arrays
# https://www.geeksforgeeks.org/problems/perfect-arrays4645/1
"""
Problem:
    An array is perfect if sum of elements = n*(n+1)/2 where n = len(arr).
    Input  : [1,2,3]   Output : True  (6 = 3*4/2)

Method Used: Accumulation loop + formula check
"""

def isPerfectArray(arr):
    n = len(arr)
    s = 0
    for i in range(0, n):
        s = s + arr[i]
    return s == n * (n + 1) // 2

# Test
print("Q44 | Perfect Array [1,2,3]    :", isPerfectArray([1, 2, 3]))
print("Q44 | Perfect Array [1,2,4]    :", isPerfectArray([1, 2, 4]))


# Q45. GFG - Sum of All Array Elements
# https://www.geeksforgeeks.org/problems/sum-all-array-elements/1
"""
Problem:
    Find sum of all elements in array.
    Input  : [1,2,3,4,5]   Output : 15

Method Used: Single-pass accumulation loop
"""

def sumArray(arr):
    total = 0
    for i in range(0, len(arr)):
        total = total + arr[i]
    return total

# Test
print("Q45 | Sum of Array             :", sumArray([1, 2, 3, 4, 5]))


# Q46. GFG - Mean of Array Elements
# https://www.geeksforgeeks.org/problems/mean0021/1
"""
Problem:
    Find the mean (average) of array elements.
    Input  : [1,2,3,4,5]   Output : 3.0

Method Used: Sum accumulation + division
"""

def meanArray(arr):
    total = 0
    for i in range(0, len(arr)):
        total = total + arr[i]
    return total / len(arr)

# Test
print("Q46 | Mean of Array            :", meanArray([1, 2, 3, 4, 5]))


# Q47. GFG - Largest Element in Array
# https://www.geeksforgeeks.org/problems/largest-element-in-array4009/1
"""
Problem:
    Find the largest element.
    Input  : [10,20,4,45,99]   Output : 99

Method Used: Linear scan with max-tracking variable
    (from 04_find_largest_element.ipynb)
"""

def findLargest(arr):
    largest = arr[0]
    for i in range(1, len(arr)):
        if arr[i] > largest:
            largest = arr[i]
    return largest

# Test
print("Q47 | Largest Element          :", findLargest([10, 20, 4, 45, 99]))


# Q48. GFG - Find Minimum and Maximum Element in an Array
# https://www.geeksforgeeks.org/problems/find-minimum-and-maximum-element-in-an-array4428/1
"""
Problem:
    Find both minimum and maximum element in a single pass.
    Input  : [3,1,4,1,5,9,2,6]   Output : min=1, max=9

Method Used: Single-pass linear scan tracking both min and max
"""

def findMinMax(arr):
    minimum = arr[0]
    maximum = arr[0]
    for i in range(1, len(arr)):
        if arr[i] < minimum:
            minimum = arr[i]
        if arr[i] > maximum:
            maximum = arr[i]
    return minimum, maximum

# Test
mn, mx = findMinMax([3, 1, 4, 1, 5, 9, 2, 6])
print("Q48 | Min =", mn, ", Max =", mx)


# Q49. GFG - Second Largest Element
# https://www.geeksforgeeks.org/problems/second-largest3735/1
"""
Problem:
    Find the second largest distinct element in array.
    Input  : [12,35,1,10,34,1]   Output : 34

Method Used: Two-variable linear scan  (from 05_find_second_largest.ipynb)
    - Track largest and second_largest simultaneously
"""

def findSecondLargest(arr):
    largest = second = -1
    for i in range(0, len(arr)):
        if arr[i] > largest:
            second  = largest
            largest = arr[i]
        elif arr[i] > second and arr[i] != largest:
            second = arr[i]
    return second

# Test
print("Q49 | Second Largest           :", findSecondLargest([12, 35, 1, 10, 34, 1]))


# =============================================================================
print("\n" + "=" * 70)
print("  All 49 Solutions Executed Successfully!")
print("=" * 70)
