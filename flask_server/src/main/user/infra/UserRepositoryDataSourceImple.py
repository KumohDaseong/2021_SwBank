from main.user.infra.UserRepository import UserRepository
from main.user.model.User import User

class UserRepositoryDataSourceImple(UserRepository):
    def __init__(self):
        self.userList = []
        self.userList.append(User("kim", "pwd", "seonjin", "01088352870", 0))
        self.userList.append(User("geun", "pwd", "geunjae", "01098521569", 0))
        self.userList.append(User("young", "pwd", "younggu", "01058591654", 0))
        self.userList.append(User("qaws12", "pwd", "gogeun", "01016958745", 0))
        self.userList.append(User("hm1792", "pwd", "seonjin", "01012659865", 0))
        self.userList.append(User("kkk2352", "pwd", "geunbam", "01041531664", 0))
        self.userList.append(User("mkzw22", "pwd", "changwo", "01026758745", 0))
        self.userList.append(User("wow1313", "pwd", "kimwow", "01056552157", 0))
        self.userList.append(User("skin7549", "pwd", "kaeishi", "01026758745", 0))
        self.userList.append(User("wsx17556", "pwd", "kimwow", "01056552157", 0))
        

    def create(self, User):
        self.userList.append(User)

    def read(self, id):
        for obj in self.userList:
            if obj.id == id:
                return obj

        return False

    def update(self, id, user):
        count = 0
        for obj in self.userList:
            if obj.id == id:
                self.userList[count] = user
            count = count + 1

    def delete(self, id):
        count = 0
        for obj in self.userList:
            if obj.id == id:
                del self.userList[count]
            count = count + 1

    def print(self):
        for obj in self.userList:
            print(obj, sep=' ')