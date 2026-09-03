class Plane:
    def takeoff(self):
        print("Plane is about to takeoff.....")
    def land(self):
        print("Plane is about to land.....")
    def fly(self):
        print("Plane is in the air.....")

class Cargoplane(Plane):
    def carryc(self):
        print("Plane is carrying cargo.....")

class PassengerPlane(Plane):
    def carryp(self):
        print("Passengers are inside the plane.....")

class FighterPlane(Plane):
    def carryw(self):
        print("Weapons are installed and ready for battle.....")

print("The CargoPlane....")
c = Cargoplane()
c.takeoff()
c.fly()
c.carryc()
c.land()


print("The Passenger Plane.....")
p = PassengerPlane()
p.takeoff()
p.fly()
p.carryp()
p.land()



print("The Fighter Plane.....")
f = FighterPlane()
f.takeoff()
f.fly()
f.carryw()
f.land()