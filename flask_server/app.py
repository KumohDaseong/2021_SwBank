# python -m venv env
# env\Scripts\activate.bat
# pip install -r requirements
# python app.py

from flask import Flask
from flask_cors import CORS
import main.incoming.controller.IncomingController as IncomingController
import main.item.controller.ItemController as ItemController
import main.record.controller.RecordController as ReconrdController
import main.user.controller.UserController as UserController
from src.main.Config import Config

app = Flask(__name__)
CORS(app)

c = Config()

# incoming -> 입출고 관련 컨트롤러를 연결하는 함수입니다.
app.register_blueprint(IncomingController.incoming_app)
app.register_blueprint(ItemController.item_app)
app.register_blueprint(ReconrdController.record_app)
app.register_blueprint(UserController.user_app)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)