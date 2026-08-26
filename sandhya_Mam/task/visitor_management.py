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

    # Visitor Check-In
    def checkIn(self):
        print("\n========== Visitor Check-In ==========")

        self.visitor_id = input("Enter Visitor ID: ").strip()
        self.visitor_name = input("Enter Visitor Name: ").strip()
        self.company = input("Enter Company Name: ").strip()
        self.mobile = input("Enter Mobile Number: ").strip()
        self.person_to_meet = input("Person to Meet: ").strip()
        self.department = input("Department: ").strip()
        self.purpose = input("Purpose of Visit: ").strip()

        while True:
            try:
                self.entry_time = int(input("Enter Entry Time (0-23): "))
                if 0 <= self.entry_time <= 23:
                    break
                print("Invalid hour! Entry time must be between 0 and 23.")
            except ValueError:
                print("Invalid input! Please enter a valid number (0-23).")

        print("\nVisitor Checked-In Successfully!")

    # Visitor Check-Out
    def checkOut(self):

        if self.visitor_id == "":
            print("\nNo Visitor has Checked-In.")
            return

        print("\n========== Visitor Check-Out ==========")

        while True:
            try:
                self.exit_time = int(input("Enter Exit Time (0-23): "))
                if 0 <= self.exit_time <= 23:
                    if self.exit_time < self.entry_time:
                        print("Invalid Exit Time! Exit time cannot be earlier than entry time.")
                    else:
                        break
                else:
                    print("Invalid hour! Exit time must be between 0 and 23.")
            except ValueError:
                print("Invalid input! Please enter a valid number (0-23).")

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

        # Reset visitor state after checkout
        self.__init__()

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
        sys.exit()


# Main Program
if __name__ == "__main__":
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

        try:
            ch = int(input("Enter Your Choice: "))
        except ValueError:
            print("Invalid Choice! Please enter a number between 1 and 4.")
            continue

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