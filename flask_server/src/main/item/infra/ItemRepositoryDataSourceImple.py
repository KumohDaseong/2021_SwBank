from main.item.model.Item import Item

class ItemRepositoryDataSourceImple():
    def __init__(self):
        self.itemList = []
        self.itemList.append(Item("3DBT12-21D1001", "허리바로", "창대", "2021.10.21", '1.jpg'))
        self.itemList.append(Item("21D1001", "ACL brace", "JDmedi", "2021.10.21", '2.jpg'))
        

    def create(self, item):
        self.itemList.append(item)

    def read(self, id):
        for obj in self.itemList:
            if obj.id == id:
                return obj

        return False

    def update(self, id, item):
        count = 0
        for obj in self.itemList:
            if obj.id == id:
                self.itemList[count] = item
            count = count + 1

    def delete(self, id):
        count = 0
        for obj in self.itemList:
            if obj.id == id:
                del self.itemList[count]
            count = count + 1

    def print(self):
        for obj in self.itemList:
            print(obj, sep=' ')