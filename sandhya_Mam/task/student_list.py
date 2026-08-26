TOTAL_STUDENTS = 10

total_marks = 0
highest_marks = 0
lowest_marks = 100

pass_count = 0
fail_count = 0
excellent_count = 0
distinction_count = 0
first_class_count = 0
second_class_count = 0

print("=== ONLINE EXAM MARK ENTRY ===")
print("Grading Criteria:")
print("Excellent: 90-100")
print("Distinction: 80-89")
print("First Class: 70-79")
print("Second Class: 50-69")
print("Fail: Below 50")
print("")

for i in range(1, TOTAL_STUDENTS + 1):
    print("Enter marks for Student", i, "(0-100):")
    marks = float(input())
    
    # Repeatedly prompt until a valid mark (0 to 100) is entered
    while marks > 100 or marks < 0:
        print("Please RE-ENTER marks correctly (0-100):")
        marks = float(input())
    
    # Track running total
    total_marks = total_marks + marks
    
    # Calculate highest and lowest marks
    if marks > highest_marks:
        highest_marks = marks
        
    if marks < lowest_marks:
        lowest_marks = marks
    
    # Determine result and category counts using the new grading criteria
    if marks >= 90:
        result = "Pass - Excellent"
        pass_count = pass_count + 1
        excellent_count = excellent_count + 1
    elif marks >= 80:
        result = "Pass - Distinction"
        pass_count = pass_count + 1
        distinction_count = distinction_count + 1
    elif marks >= 70:
        result = "Pass - First Class"
        pass_count = pass_count + 1
        first_class_count = first_class_count + 1
    elif marks >= 50:
        result = "Pass - Second Class"
        pass_count = pass_count + 1
        second_class_count = second_class_count + 1
    else:
        result = "Fail"
        fail_count = fail_count + 1
        
    print("--> Immediate Result for Student", i, ":", result)
    print("")

# Calculate average
avg_marks = total_marks / TOTAL_STUDENTS

# Display Final Report
print("===================================")
print("          FINAL REPORT          ")
print("===================================")
print("Total Marks:", total_marks)
print("Average Marks:", round(avg_marks, 2))
print("Highest Marks:", highest_marks)
print("Lowest Marks:", lowest_marks)
print("-----------------------------------")
print("Pass Count:", pass_count)
print("Fail Count:", fail_count)
print("-----------------------------------")
print("Category-wise Breakdown:")
print("Excellent (90-100):", excellent_count)
print("Distinction (80-89):", distinction_count)
print("First Class (70-79):", first_class_count)
print("Second Class (50-69):", second_class_count)
print("===================================")

# Additional analysis using only if statements and loops
print("")
print("=== PERFORMANCE ANALYSIS ===")

# Check overall class performance
if avg_marks >= 75:
    print("Overall Performance: Excellent")
elif avg_marks >= 60:
    print("Overall Performance: Good")
elif avg_marks >= 50:
    print("Overall Performance: Average")
else:
    print("Overall Performance: Needs Improvement")

# Check pass percentage
pass_percentage = (pass_count / TOTAL_STUDENTS) * 100
if pass_percentage >= 80:
    print("Pass Rate: High -", pass_percentage, "%")
elif pass_percentage >= 50:
    print("Pass Rate: Moderate -", pass_percentage, "%")
else:
    print("Pass Rate: Low -", pass_percentage, "%")

# Identify top performers (Excellent students)
if excellent_count > 0:
    print("Number of Excellent students:", excellent_count)
    if excellent_count == TOTAL_STUDENTS:
        print("All students achieved Excellent grade!")
    elif excellent_count >= TOTAL_STUDENTS / 2:
        print("More than half the class achieved Excellent grade!")

# Identify students who need improvement (Fail students)
if fail_count > 0:
    print("Number of students who failed:", fail_count)
    if fail_count >= TOTAL_STUDENTS / 2:
        print("ALERT: More than half the class is failing!")
    else:
        print("Some students need extra support.")
print("===================================")