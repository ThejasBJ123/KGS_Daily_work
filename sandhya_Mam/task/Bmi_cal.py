#BMI Calculator:
#Create a function that accepts
#weight
#height
#Return BMI.

def calculate_bmi(weight, height):
    if height > 3:
        height = height / 100
    bmi = round(weight / (height ** 2), 2)
    
    if bmi < 18.5:
        category = "Underweight"
    elif 18.5 <= bmi < 25:
        category = "Normal weight"
    elif 25 <= bmi < 30:
        category = "Overweight"
    else:
        category = "Obese"

    return bmi, category

weight = float(input("Enter the weight (in kg): "))
height = float(input("Enter the Height (in cm): "))

bmi_val, status = calculate_bmi(weight, height) 
print(f"BMI: {bmi_val} ({status})")  


# def cal_bmi(weight, height):
#     Bmi=weight/(height*height)
#     return Bmi

# w=float(input("enter the weight of the body (Kg): "))
# h=float(input("enter the height [meter] : "))

# result=cal_bmi(w,h)

# print("output :", result)


