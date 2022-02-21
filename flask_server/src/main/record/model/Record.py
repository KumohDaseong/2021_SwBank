
class Record():
    def __init__(self, di, date, itemName, userId, method):
        self.di = di
        self.date = date
        self.itemName = itemName
        self.userId = userId
        self.method = method
    def __str__(self):
        return "di: {0}, date: {1}, itemName: {2}, userId: {3}, method: {4}".format(self.di, self.date, self.itemName, self.userId, self.method)
    def toJSON(self):
        return {"di": self.di, "date": self.date, "itemName": self.itemName, "userId": self.userId, "method": self.method}