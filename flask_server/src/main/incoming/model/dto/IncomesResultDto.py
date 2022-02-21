class IncomesResultDto:
    def __init__(self,result,msg,incoming_list):
        self.result = result
        self.msg = msg
        self.incoming_list = incoming_list
    def toJSON(self):
        return {"result": self.result, "msg": self.msg, "incoming_list": self.incoming_list}
    def __eq__(self, other): 
        return self.result == other.result and self.msg == other.msg and self.incoming_list == other.incoming_list