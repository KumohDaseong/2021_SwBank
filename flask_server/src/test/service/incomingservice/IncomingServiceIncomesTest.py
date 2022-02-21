
from main.incoming.service.IncomingService import IncomingService
from src.main.infra.datasource.IncomingRepositoryDataSourceImple import IncomingRepositoryDataSourceImple
from src.main.domain.dto.IncomesResultDto import IncomesResultDto
from main.incoming.model.Incoming import Incoming
from datetime import datetime
import pytest

incomingRepository = IncomingRepositoryDataSourceImple()
incomingService = IncomingService(incomingRepository)

@pytest.fixture
def add_test_income():
    incomingRepository.create(Incoming("id","userid",datetime.now(),"-"))

def test_succes_read_incomes(add_test_income):
    # given
    id = "id"
    incomings = incomingRepository.readAll(id)
    expected = IncomesResultDto(True, "Getting Incomes List!", incomings)
    
    # when
    actual = incomingService.incomesService(id)

    # then
    assert actual == expected
