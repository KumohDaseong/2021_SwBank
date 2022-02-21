import json

class Incoming():
    def __init__(self,di, user, income ,outcome):
        self.di = di
        self.user = user
        self.income = income
        self.outcome = outcome
    def __str__(self):
        return "di: {0}, user: {1}, income: {2}, outcome: {3}".format(self.di, self.user, self.income, self.outcome)

    def setOutcome(self, outcome):
        self.outcome = outcome
        
    def toJSON(self):
        return {"di": self.di, "user": self.user, "income": self.income.strftime('%Y-%m-%d \n\n %H:%M:%S'), "outcome": self.outcome.strftime('%Y-%m-%d \n\n %H:%M:%S')}
