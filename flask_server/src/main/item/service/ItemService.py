from main.item.model.dto.ItemResultDto import ItemResultDto
from src.main.domain.dto.IncomeResultDto import IncomeResultDto
from main.incoming.model.dto.OutcomeResultDto import OutcomeResultDto
from src.main.domain.dto.IncomesResultDto import IncomesResultDto
from main.item.infra.ItemRepository import ItemRepository
from main.incoming.model.Incoming import Incoming
from datetime import datetime
from werkzeug.utils import secure_filename
import pyzbar.pyzbar as pyzbar
import cv2
from datetime import datetime
import numpy as np

class ItemService:
    def __init__(self, itemRepository: ItemRepository):
        self.itemRepository = itemRepository

    def uploadSerivce(self,file_name):

        img = cv2.imread('static/uploads/' + secure_filename(file_name))
            
        i = self.preprocessing(img)

        itemResultDto = self.read_frame(i)

        return itemResultDto
            

    def preprocessing(self, img):

        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        kernel_sharpen_1 = np.array([[1,-2,1],[-2,5,-2],[1,-2,1]])

        f_image = cv2.filter2D(gray,-1,kernel_sharpen_1)

        ret, i = cv2.threshold(gray, 100, 255, cv2.THRESH_BINARY)

        return gray
    
    def read_frame(self, img):
        try:
            decorded = pyzbar.decode(img)
            value = decorded[0].data.decode('utf-8')
            
            item, di = self.read_barcode(value)

            return ItemResultDto(True, "Success read barcode", item, di)

        except Exception as e:

            return ItemResultDto(False, "Fail read barcode", None, None)
    
    def read_barcode(self, value):
        value = value.replace('\u001d', '')
        count = 2
        di = ""
        lotNo = ""
        manufYm = ""
        useTmlmt = ""
        itemSeq = ""
        while count != len(value):
            if value[0:count] == "01":
                di = value[count:count+14]
                count = count+14
            elif value[count:count+2] == "10":
                lotNo = value[count+2:count+8]
                count = count + 8
            elif value[count:count+2] == "11":
                manufYm = value[count+2:count+8]
                count = count + 8
            elif value[count:count+2] == "17":
                useTmlmt = value[count+2:count+8]
                count = count + 8
            elif value[count:count+2] == "21":
                itemSeq = value[count+2:]
                count = len(value)
        print(f"di : {di}, lotNo : {lotNo}, manufYm : {manufYm}, useTmlmt : {useTmlmt}, itemSeq : {itemSeq}")
        item = self.itemRepository.read(itemSeq)

        return item, di