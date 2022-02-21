from main.user.model.User import User
from main.user.service.UserService import UserService
from main.user.infra.UserRepositoryDataSourceImple import UserRepositoryDataSourceImple
from main.user.model.SignUpResultDto import SignUpResultDto
import pytest

userRepository = UserRepositoryDataSourceImple()
userService = UserService(userRepository)

@pytest.fixture
def add_test_user():
    userRepository.create(User("test","test","test","01032320232",0))

def test_success_user_signup(add_test_user):
    # given
    params = {"id" : "different_id" ,"pwd": "test" ,"name" : "test", "p_number":"01032320232", "m_type" : 0}
    expected = SignUpResultDto(True, "sign up success")

    # when
    actual = userService.signUpService(params)

    # then
    assert actual == expected

def test_fail_wrong_id_user_login(add_test_user):
    # given
    params = {"id" : "test" ,"pwd": "test" ,"name" : "test", "p_number":"01032320232", "m_type" : 0}
    expected = SignUpResultDto(False, "sign up fail")

    # when
    actual = userService.signUpService(params)

    # then
    assert actual == expected
