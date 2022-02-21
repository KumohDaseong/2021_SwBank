class LoginResultDto:
    def __init__(self,result,msg,name):
        self.result = result
        self.msg = msg
        self.name = name
    def toJSON(self):
        return {"result": self.result, "msg": self.msg, "name": self.name}
    def __eq__(self, other): 
        return self.result == other.result and self.msg == other.msg and self.name == other.name
    
        