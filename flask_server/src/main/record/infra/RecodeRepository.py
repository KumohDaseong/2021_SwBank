
from abc import ABC, abstractmethod

class RecordRepository(ABC):

    @abstractmethod
    def create(self, Record):
        pass

    @abstractmethod
    def read(self, di):
        pass

    @abstractmethod
    def readAll(self, userId):
        pass

    @abstractmethod
    def update(self, di, Record):
        pass

    @abstractmethod
    def delete(self, di):
        pass

    @abstractmethod
    def print(self):
        pass