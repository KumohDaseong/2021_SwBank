from flask import request, Blueprint, Response, send_file, render_template, json
from werkzeug.utils import secure_filename
from main.item.model.dto.ItemResultDto import ItemResultDto
from src.main.Config import Config


c = Config()
itemService = c.getItemService()

item_app = Blueprint('item_app', __name__, url_prefix='/')

def checkParameter(params):
    return len(params) == 0

@item_app.route('/', methods=['GET', 'POST'])
def hello():
    return render_template('index.html')

@item_app.route('/upload', methods=['POST'])
def upload():
    f = request.files['file']
    f.save('static/uploads/' + secure_filename(f.filename))
    itemResultDto:ItemResultDto = itemService.uploadSerivce(f.filename)
    if not itemResultDto.result:
        return Response(json.dumps(itemResultDto.toJSON()), status=400, mimetype='application/json')
    return Response(json.dumps(itemResultDto.toJSON()), status=200, mimetype='application/json')

@item_app.route('/img/<id>', methods=['GET'])
def img(id):
    return send_file('img/'+id)