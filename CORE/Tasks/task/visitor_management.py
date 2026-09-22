# File Name: visitor_management.py
# Question: Corporate Visitor Management System
# Write an Object-Oriented Python program for Kaizentrix Global Solutions
# to manage Visitor Check-In, Check-Out, Guidelines, and Exit.

class Manage:

    def __init__(self):
        self.visitor_id = ""
        self.visitor_name = ""
        self.company = ""
        self.mobile = ""
        self.person_to_meet = ""
        self.department = ""
        self.purpose = ""
        self.entry_time = 0
        self.exit_time = 0

    def checkIn(self):
        print("\n========== Visitor Check-In ==========")

        self.visitor_id = input("Enter Visitor ID: ")
        self.visitor_name = input("Enter Visitor Name: ")
        self.company = input("Enter Company Name: ")
        self.mobile = input("Enter Mobile Number: ")
        self.person_to_meet = input("Person to Meet: ")
        self.department = input("Department: ")
        self.purpose = input("Purpose of Visit: ")

        while True:
            self.entry_time = int(input("Enter Entry Time (0-23): "))

            if 0 <= self.entry_time <= 23:
                break

            print("Invalid Entry Time!")

        print("\nVisitor Checked-In Successfully!")

    def checkOut(self):

        if self.visitor_id == "":
            print("\nNo Visitor has Checked-In.")
            return

        print("\n========== Visitor Check-Out ==========")

        while True:
            self.exit_time = int(input("Enter Exit Time (0-23): "))

            if self.exit_time < self.entry_time:
                print("Exit time cannot be earlier than entry time.")

            elif self.exit_time > 23:
                print("Invalid Exit Time!")

            else:
                break

        total_time = self.exit_time - self.entry_time

        print("\n========== Visitor Summary ==========")
        print("Visitor ID       :", self.visitor_id)
        print("Visitor Name     :", self.visitor_name)
        print("Company          :", self.company)
        print("Mobile           :", self.mobile)
        print("Person to Meet   :", self.person_to_meet)
        print("Department       :", self.department)
        print("Purpose          :", self.purpose)
        print("Entry Time       :", self.entry_time)
        print("Exit Time        :", self.exit_time)
        print("Meeting Duration :", total_time, "Hours")
        print("=====================================")

        self.__init__()

    def guidelines(self):
        print("\n========== Visitor Guidelines ==========")
        print("1. Wear your Visitor ID Card.")
        print("2. Photography is not allowed.")
        print("3. Follow company security rules.")
        print("4. Return visitor pass before leaving.")
        print("5. Smoking is prohibited.")
        print("6. Report to reception while exiting.")
        print("========================================")


# ================= MAIN PROGRAM =================

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

    choice = input("Enter Your Choice: ")

    if choice == "1":
        obj.checkIn()

    elif choice == "2":
        obj.checkOut()

    elif choice == "3":
        obj.guidelines()

    elif choice == "4":
        print("\nThank You for using Visitor Management System.")
        print("Exiting...")
        break

    else:
        print("Invalid Choice! Please Try Again.")