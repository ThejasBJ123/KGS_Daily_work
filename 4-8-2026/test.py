class Manage:
    def __init__(self):
        self.vistor_id = ""
        self.vistor_name = ""
        self.company = ""
        self.mobile = ""
        self.person_to_meet = ""
        self.department = ""
        self.purpose = ""
        self.entry_time = 0
        self.exit_time = 0

    # Visitor Check-In
    def checkIn(self):
        print("\n========== Visitor Check-In ==========")

        self.vistor_id = input("Enter Visitor ID: ")
        self.vistor_name = input("Enter Visitor Name: ")
        self.company = input("Enter Company Name: ")
        self.mobile = input("Enter Mobile Number: ")
        self.person_to_meet = input("Person to Meet: ")
        self.department = input("Department: ")
        self.purpose = input("Purpose of Visit: ")
        self.entry_time = int(input("Enter Entry Time (0-23): "))

        print("\nVisitor Checked-In Successfully!")

    # Visitor Check-Out
    def checkOut(self):

        if self.vistor_id == "":
            print("\nNo Visitor has Checked-In.")
            return

        print("\n========== Visitor Check-Out ==========")

        self.exit_time = int(input("Enter Exit Time (0-23): "))

        if self.exit_time < self.entry_time:
            print("Invalid Exit Time!")
            return

        total_time = self.exit_time - self.entry_time

        print("\n========== Visitor Summary ==========")
        print("Visitor ID       :", self.vistor_id)
        print("Visitor Name     :", self.vistor_name)
        print("Company          :", self.company)
        print("Mobile           :", self.mobile)
        print("Person to Meet   :", self.person_to_meet)
        print("Department       :", self.department)
        print("Purpose          :", self.purpose)
        print("Entry Time       :", self.entry_time)
        print("Exit Time        :", self.exit_time)
        print("Meeting Duration :", total_time, "Hours")
        print("=====================================")

    # Visitor Guidelines
    def guidelines(self):
        print("\n========== Visitor Guidelines ==========")
        print("1. Wear your Visitor ID Card.")
        print("2. Photography is not allowed.")
        print("3. Follow company security rules.")
        print("4. Return visitor pass before leaving.")
        print("5. Smoking is prohibited.")
        print("6. Report to the reception while exiting.")
        print("========================================")

    # Exit
    def exit(self):
        print("\nThank You for using Visitor Management System.")
        print("Exiting...")
        exit()


# Main Program
print("==============================================")
print("        KAIZENTRIX GLOBAL SOLUTIONS")
print("     Corporate Visitor Management System")
print("==============================================")

obj = Manage()

while True:

    print("\n----------- MENU -----------")
    print("1. Visitor Check-In")
    print("2. Visitor Check-Out")
    print("3. Visitor Guidelines")
    print("4. Exit")
    print("----------------------------")

    ch = int(input("Enter Your Choice: "))

    if ch == 1:
        obj.checkIn()

    elif ch == 2:
        obj.checkOut()

    elif ch == 3:
        obj.guidelines()

    elif ch == 4:
        obj.exit()

    else:
        print("Invalid Choice! Please Try Again.")