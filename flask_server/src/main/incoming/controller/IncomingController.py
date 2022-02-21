"""

작성자 : 근재, 용구

작성 일자 : 언제

작성 내용 : 입출고 내역을 관리하는 컨트롤러 입니다.
데이터 베이스에 있는지 확인하고 관련 내용을 body에 넣어서 포장합니다.

todo : 관련 테스트 코드가 작성되어 있지 않습니다. 이 부분을 구현해야 합니다.

fixme : 여기서 예외처리 부분을 임의로 만들었습니다. 이 부분을 글로벌하게 수정해서 다른 컨트롤러에서 처리하도록 해야 합니다.

수정한 사람 : 김선진

수정 일자 : 언제

"""

from flask import request, json, Blueprint, jsonify, Response
from src.main.domain.dto.IncomeResultDto import IncomeResultDto
from main.incoming.model.dto.OutcomeResultDto import OutcomeResultDto
from src.main.domain.dto.IncomesResultDto import IncomesResultDto
from src.main.Config import Config

c = Config()
incomingService = c.getIncomingService()

incoming_app = Blueprint('incoming_app', __name__, url_prefix='/')

# 이 함수는 파라미터 값이 없는지 검증하는 함수입니다.
def checkParameter(params):
    return len(params) == 0

# 이 함수는 입고 내역을 가져오도록 하는 컨트롤러입니다.
@incoming_app.route('/income/<id>', methods = ['POST'])
def income(id):

    # http 요청에서 데이터를 가져오는 기능입니다.
    params = json.loads(request.get_data())

    # 이 함수는 파라미터 값이 없는지 검증하는 함수입니다.
    if checkParameter(params):
        return jsonify({"result": False, "msg": "Wrong Params"})

    # 데이터 베이스에서 입출고 내역을 가져옵니다.
    incomeResultDto:IncomeResultDto = incomingService.incomeService(id,params)

    # 가져온 데이터가 없으면 다음과 같이 에러 페이지를 넘깁니다.
    if not incomeResultDto.result:
        return Response(json.dumps(incomeResultDto.toJSON()), status=400, mimetype='application/json')

    # 가져온 데이터를 http body에 담아서 넘깁니다.
    return Response(json.dumps(incomeResultDto.toJSON()), status=200, mimetype='application/json')














@incoming_app.route('/outcome/<id>', methods = ['GET'])
def outcome(id):
    outcomeResultDto:OutcomeResultDto = incomingService.outcomeService(id)
    if not outcomeResultDto.result:
        return Response(json.dumps(outcomeResultDto.toJSON()), status=400, mimetype='application/json')
    return Response(json.dumps(outcomeResultDto.toJSON()), status=200, mimetype='application/json')

@incoming_app.route('/incomes/<id>', methods = ['GET'])
def imcomes(id):
    incomesResultDto:IncomesResultDto = incomingService.incomesService(id)
    return Response(json.dumps(incomesResultDto.toJSON()), status=200, mimetype='application/json')




