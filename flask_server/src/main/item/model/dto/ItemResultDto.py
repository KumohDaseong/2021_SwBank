import json

class ItemResultDto:
    def __init__(self,result,msg,item,di):
        self.result = result
        self.msg = msg
        self.item = item
        self.di = di

    def __str__(self):
        return "result: {0}, msg: {1}, item: {2}, di: {3}".format(self.result, self.msg, self.item, self.di)
    
    def toJSON(self):
        return {"result": self.result, "msg": self.msg, "item": self.item.toJSON(), "di":self.di}

    def __eq__(self, other): 
        return self.result == other.result and self.msg == other.msg and self.item == other.item and self.di == other.di

    