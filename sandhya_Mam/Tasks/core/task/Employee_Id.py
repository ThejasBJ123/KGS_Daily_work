# Employee ID Generator

class Employe:

    company_name = "Kaizentrix Global Solutions"
    employee_count = 1000

    def __init__(self, employee_name, department):
        self.employee_name = employee_name
        self.department = department

    def generate_employee_id(self):
        Employe.employee_count += 1

        employee_id = "EMP" + "KGS" + str(Employe.employee_count)

        print("\n===================================")
        print("Company Name :", Employe.company_name)
        print("Name         :", self.employee_name)
        print("Employee ID  :", employee_id)
        print("Department   :", self.department)
        print("===================================")


# Main Program

name = input("Enter Employee Name: ")
department = input("Enter Department: ")

emp = Employe(name, department)
emp.generate_employee_id()