from main.user.model.LoginResultDto import LoginResultDto
from main.user.model.SignUpResultDto import SignUpResultDto
from main.user.infra.UserRepository import UserRepository
from main.user.model.User import User

class UserService:
    def __init__(self, userRepository: UserRepository):
        self.userRepository = userRepository

    def loginService(self, params):
        user = self.userRepository.read(params["id"])

        if((user == False) or (params["pwd"] != user.pwd) or (params["m_type"] != user.m_type)):
            return LoginResultDto(False, "login fail", "")
        
        return LoginResultDto(True, "login success", user.name)

    def signUpService(self, params):
        user = self.userRepository.read(params["id"])

        if not user:
            self.userRepository.create(User(
                params['id'], params['pwd'], params['name'], params['p_number'], params['m_type']))
            return SignUpResultDto(True, "sign up success")

        return SignUpResultDto(False, "sign up fail")
