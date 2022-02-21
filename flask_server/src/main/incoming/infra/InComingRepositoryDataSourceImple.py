from main.incoming.infra.IncomingRepository import IncomingRepository
from main.incoming.model.Incoming import Incoming
from datetime import datetime, timedelta


class IncomingRepositoryDataSourceImple(IncomingRepository):
    def __init__(self):
        self.incomingList = []
        self.incomingList.append(Incoming("08800140600090","kim",(datetime.now()- timedelta(days=2)),(datetime.now()- timedelta(days=1)) ))
        
    def create(self, incoming):
        self.incomingList.append(incoming)

    def read(self, di):
        for obj in reversed(self.incomingList):
            if obj.di == di:
                return obj

        return False
        
    def readAll(self, di):
        readList = []
        for obj in self.incomingList:
            if obj.di == di:
                readList.append(obj.toJSON())

        return readList

    def update(self, di, incoming):
        count = len(self.incomingList)
        print(count)
        for obj in reversed(self.incomingList):
            print(obj)

    def delete(self, di):
        count = 0
        for obj in self.incomingList:
            if obj.di == di:
                del self.incomingList[count]
            count = count + 1

    def print(self):
        for obj in self.incomingList:
            print(obj, sep=' ')