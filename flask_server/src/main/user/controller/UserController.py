from flask import request, json, Blueprint, jsonify, Response
from main.user.model.LoginResultDto import LoginResultDto
from main.user.model.SignUpResultDto import SignUpResultDto
from src.main.Config import Config

c = Config()
userService = c.getUserService()

user_app = Blueprint('user_app', __name__, url_prefix='/')

def checkParameter(params):
    return len(params) == 0

@user_app.route('/login', methods=['POST'])
def login():
    params = json.loads(request.get_data())

    if checkParameter(params):
        return jsonify({"result": False, "msg": "Wrong Params"})

    loginResultDto:LoginResultDto = userService.loginService(params)
    
    if not loginResultDto.result:
        return Response(json.dumps(loginResultDto.toJSON()), status=400, mimetype='application/json')
    return Response(json.dumps(loginResultDto.toJSON()), status=201, mimetype='application/json')

@user_app.route('/signup', methods=['POST'])
def signUp():
    params = json.loads(request.get_data())

    if checkParameter(params):
        return jsonify({"result": False, "msg": "Wrong Params"})
    
    signUpResultDto:SignUpResultDto = userService.signUpService(params)

    if not signUpResultDto.result:
        return Response(json.dumps(signUpResultDto.toJSON), status=409, mimetype='application/json')
    return Response(json.dumps(signUpResultDto.toJSON), status=201, mimetype='application/json')