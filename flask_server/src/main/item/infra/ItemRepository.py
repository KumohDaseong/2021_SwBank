from abc import ABC, abstractmethod

class ItemRepository(ABC):
    @abstractmethod
    def create(self, item):
        pass

    @abstractmethod
    def read(self, id):
        pass

    @abstractmethod
    def update(self, id, item):
        pass

    @abstractmethod
    def delete(self, id):
        pass

    @abstractmethod
    def print(self):
        pass