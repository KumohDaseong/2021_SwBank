from main.incoming.service.IncomingService import IncomingService
from src.main.infra.datasource.IncomingRepositoryDataSourceImple import IncomingRepositoryDataSourceImple
from src.main.domain.dto.IncomeResultDto import IncomeResultDto

incomingRepository = IncomingRepositoryDataSourceImple()
incomingService = IncomingService(incomingRepository)

def test_succes_create_incoming():
    # given
    id = "id"
    params = {"userId" : "userId"}
    expected = IncomeResultDto(True, "create incoming success")
    
    # when
    actual = incomingService.incomeService(id,params)

    # then
    assert actual == expected
