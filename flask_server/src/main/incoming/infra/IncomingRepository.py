from abc import ABC, abstractmethod

class IncomingRepository(ABC):

    @abstractmethod
    def create(self, incoming):
        pass

    @abstractmethod
    def read(self, di):
        pass
        
    @abstractmethod
    def readAll(self, di):
        pass

    @abstractmethod
    def update(self, di, incoming):
        pass

    @abstractmethod
    def delete(self, di):
        pass

    @abstractmethod
    def print(self):
        pass