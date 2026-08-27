#employ id generator
class Employe:
    company_name = "Kaizentrix global solutions"
    employee_count = 1000

    def __init__(self,employee_name, department):
        self. employee_name= employee_name
        self.department = department

    def generate_employee_id(self):
        Employe.employee_count+=1
        employee_id = "EMP"+"KGS" + str(Employe.employee_count)
        
    
        print("\n===================================")
        print("Company name: ", Employe.company_name)
        print("Name:", self.employee_name)
        print("employee_id:", employee_id)
        print("Department:", self.department)
        print("\n============================")
emp1= Employe("POOJA","INTERN")
emp1.generate_employee_id()
emp2= Employe("Abhi","Engineer")
emp2.generate_employee_id()
emp3= Employe("Janu","Finance")
emp3.generate_employee_id()