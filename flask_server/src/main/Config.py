from src.main.infra.datasource.IncomingRepositoryDataSourceImple import IncomingRepositoryDataSourceImple
from main.item.infra.ItemRepositoryDataSourceImple import ItemRepositoryDataSourceImple
from main.user.infra.UserRepositoryDataSourceImple import UserRepositoryDataSourceImple
from main.record.infra.RecordRepositoryDataSourceImple import RecordRepositoryDataSourceImple
from main.incoming.service.IncomingService import IncomingService
from main.item.service.ItemService import ItemService
from main.user.service.UserService import UserService
from main.record.service.RecordService import RecordService



class Config(object):
    def __new__(cls, *args, **kwargs):
        if not hasattr(cls, "_instance"):
            cls._instance = super().__new__(cls)  
        return cls._instance                      

    def __init__(self):
        self._incomingRepository = IncomingRepositoryDataSourceImple()
        self._itemRepository = ItemRepositoryDataSourceImple()
        self._userRepository = UserRepositoryDataSourceImple()
        self._recordRepository = RecordRepositoryDataSourceImple()

        self._incomingService = IncomingService(self._incomingRepository)
        self._itemService = ItemService(self._itemRepository)
        self._userService = UserService(self._userRepository)
        self._recordService = RecordService(self._recordRepository)
    
    def getIncomingService(self):
        return self._incomingService
    
    def getItemService(self):
        return self._itemService
    
    def getUserService(self):
        return self._userService
    
    def getRecordService(self):
        return self._recordService
    