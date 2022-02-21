from abc import ABC, abstractmethod


class UserRepository(ABC):

    @abstractmethod
    def create(self, User):
        pass

    @abstractmethod
    def read(self, id):
        pass

    @abstractmethod
    def update(self, id, user):
        pass

    @abstractmethod
    def delete(self, id):
        pass

    @abstractmethod
    def print(self):
        pass