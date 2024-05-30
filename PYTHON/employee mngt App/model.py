import uuid

# define employee class
class Employee():

def_init_(self,first_name,last_name,email,phone_no,job_description=None,Post="Traine",yrs_of_exp=0, salary=0.0)

   self.emp_id=uuid.uuid4()
   self.first_name=fisrt_name
   self.last_name=last_name
   self.email=email
   self.phone_no= phone_no
   self.post=post
   self.job_description=job_description
   self.yrs_of_exp=yrs_of_exp
   self.salary=salary
  
def__repr__(self) ->str:
  return f"Employee->{self.emp_id}" 

#define setters and getters

@classmethod
def set_first_name(self,first_name):
  self.first_name=fisrt_name
   return self.first_name

  Q@classmethod
  def set_last_name(self,last_name):
    self.last_name=last_name
    return self.last_name
  
    @classmethod
    def set_email(cls,email):
      if email.endwith(".com"):
        return cls.email
      esle:
      print("invalid Email")


      @classmethodde 
      set_phone_n0(cls,phone_no):
      if len(phone_no)==11:
        return cls.phone_no
      else:
        print("invalidphone number")

        def display_employe(self):
          info={
             "Emp_ID":self.emp_id,
             "first_name":self.first_name,
             "last_name":self.last_name,
             "phone No": self.phone_no,
             "job_description":self.job_description,
             "post":self.post,
             "yrs_of_exp":self.yrs_of_exp,
             "salary":self.salary,

              return info

              # collecting user data
              first_name=input("Enter your Last Name:")
              last_name=input("Enter your ast name:")
              email=input("enter your email:")
              phone_no=input("enter your phone no:")

              #create an object
     Employee=employee(first_name=Employee.set_first_name(first_nsme),
     last_name=Employee.set_last-name(last_name),
     email=email,
     phone_no=phone-no)

      print.info
    