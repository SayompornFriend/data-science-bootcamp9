##Create ATM function
from random  import randint

class ATM:
  def __init__(self, account_name, bank_name, initial):
      self.account_name = account_name
      self.bank_name = bank_name
      self.balance = initial
  ## string represention use when print(acc1)
  def __str__(self):
      return f"This is account of: {self.account_name} , bank: {self.bank_name}"
  ##method function
  
  def check_balance(self):
      print(f"Balance: {self.balance} THB")

  def deposite(self,money):
      self.balance += money
      print(f"Deposite sucession// Your new balance: {self.balance}")

  def withdraw(self,money):
      self.balance -= money
      print(f"Withdraw succession// Your new balance: {self.balance}")

  def get_otp(self):
      OTP = randint(1000,9999)
      print(f"Your OTP is {OTP} this OTP will avilable in 2 minute")

  def chang_name(self,name_change):
      self.account_name = name_change
      print(f"Your account name change already this new account name: {self.account_name}")
----------------------------------------------------------------------------------------------------------
##Test function
acc1 = ATM("Yommy","scb",100)
print(acc1)
acc1.check_balance()
acc1.deposite(500)
acc1.withdraw(300)
acc1.get_otp()
acc1.chang_name("Sayomporn")
