from main.user.model.User import User
from main.user.service.UserService import UserService
from main.user.infra.UserRepositoryDataSourceImple import UserRepositoryDataSourceImple
from main.user.model.LoginResultDto import LoginResultDto
import pytest

userRepository = UserRepositoryDataSourceImple()
userService = UserService(userRepository)

@pytest.fixture
def add_test_user():
    userRepository.create(User("test","test","test","01032320232",0))

def test_success_user_login(add_test_user):
    # given
    params = {"id" : "test" ,"pwd": "test" , "m_type" : 0}
    expected = LoginResultDto(True, "login success", "test")

    # when
    actual = userService.loginService(params)

    # then
    assert actual == expected

def test_fail_wrong_id_user_login(add_test_user):
    # given
    params = {"id" : "wrong_id" ,"pwd": "test" , "m_type" : 0}
    expected = LoginResultDto(False, "login fail", "")

    # when
    actual = userService.loginService(params)

    #then
    assert actual == expected

def test_fail_wrong_pwd_user_login(add_test_user):
    # given
    params = {"id" : "test" ,"pwd": "wrong_pwd" , "m_type" : 0}
    expected = LoginResultDto(False, "login fail", "")

    # when
    actual = userService.loginService(params)

    # then
    assert actual == expected

def test_fail_wrong_Mtype_user_login(add_test_user):
    # given
    params = {"id" : "test" ,"pwd": "test" , "m_type" : 1}
    expected = LoginResultDto(False, "login fail", "")

    # when
    actual = userService.loginService(params)

    # then
    assert actual == expected
