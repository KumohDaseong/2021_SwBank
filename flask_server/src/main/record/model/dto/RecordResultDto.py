class RecordResultDto:
    def __init__(self,result,msg,record_list):
        self.result = result
        self.msg = msg
        self.record_list = record_list
    def toJSON(self):
        return {"result": self.result, "msg": self.msg, "record_list": self.record_list}
    def __eq__(self, other): 
        return self.result == other.result and self.msg == other.msg and self.record_list == other.record_list