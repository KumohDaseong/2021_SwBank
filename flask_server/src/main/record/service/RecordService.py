from main.record.model.dto.RecordResultDto import RecordResultDto
from main.record.infra.RecodeRepository import RecordRepository
from main.record.model.Record import Record
from datetime import datetime

class RecordService:
    def __init__(self, recordRepository: RecordRepository):
        self.recordRepository = recordRepository

    def recordService(self, id):
        records = self.recordRepository.readAll(id)

        return RecordResultDto(True, "Getting Record List!", records)