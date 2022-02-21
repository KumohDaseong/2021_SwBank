from datetime import datetime
from main.incoming.model.Incoming import Incoming
from main.incoming.service.IncomingService import IncomingService
from src.main.infra.datasource.IncomingRepositoryDataSourceImple import IncomingRepositoryDataSourceImple
from main.incoming.model.dto.OutcomeResultDto import OutcomeResultDto
import pytest

incomingRepository = IncomingRepositoryDataSourceImple()
incomingService = IncomingService(incomingRepository)

@pytest.fixture
def add_test_income():
    incomingRepository.create(Incoming("id","userid",datetime.now(),"-"))
    
def test_succes_update_outcome(add_test_income):
    # given
    id = "id"
    expected = OutcomeResultDto(True, "update outcoming success")

    # when
    actual = incomingService.outcomeService(id)

    # then
    assert actual == expected
    
def test_fail_update_outcome_no_incoming_data(add_test_income):
    # given
    id = "wrong_id"
    expected = OutcomeResultDto(False, "No incoming data, Income first!")

    # when
    actual = incomingService.outcomeService(id)

    # then
    assert actual == expected