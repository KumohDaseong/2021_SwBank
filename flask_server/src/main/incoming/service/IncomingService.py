from src.main.domain.dto.IncomeResultDto import IncomeResultDto
from main.incoming.model.dto.OutcomeResultDto import OutcomeResultDto
from src.main.domain.dto.IncomesResultDto import IncomesResultDto
from main.incoming.infra.IncomingRepository import IncomingRepository
from main.incoming.model.Incoming import Incoming
from datetime import datetime

class IncomingService:
    def __init__(self, incomingRepository: IncomingRepository):
        self.incomingRepository = incomingRepository

    def incomeService(self,id,params):
        self.incomingRepository.create(Incoming(id, params["userId"], datetime.now(),"-"))
        return IncomeResultDto(True, "create incoming success")
    
    def outcomeService(self, id):
        incoming = self.incomingRepository.read(id)

        if incoming == False:
            return OutcomeResultDto(False, "No incoming data, Income first!")

        incoming.setOutcome(datetime.now())
        self.incomingRepository.update(id, incoming)

        return OutcomeResultDto(True, "update outcoming success")

    def incomesService(self, id):
        incomings = self.incomingRepository.readAll(id)

        return IncomesResultDto(True, "Getting Incomes List!", incomings)