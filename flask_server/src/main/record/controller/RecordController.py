from flask import Blueprint, Response, json
from src.main.Config import Config

c = Config()
recordService = c.getRecordService()

record_app = Blueprint('record_app', __name__, url_prefix='/')

@record_app.route('/record/<userId>', methods = ['GET'])
def record(userId):
    recordResultDto = recordService.recordService(userId)
    return Response(json.dumps(recordResultDto.toJSON()), status=200, mimetype='application/json')
    