from flask import request

class Item():
    def __init__(self, id, name, company ,date_manufacture, img):
        self.id = id
        self.name = name
        self.company = company
        self.date_manufacture = date_manufacture
        self.img = img
        
    def __str__(self):
        return "id: {0}, name: {1}, company: {2}, date_manufacture: {3}, img: {4}".format(self.id, self.name, self.company, self.date_manufacture, self.img)
    
    def toJSON(self):
        return {"id": self.id, "name": self.name, "company": self.company, "data_manufacture": self.date_manufacture, "img" : str(request.url_root)+"img/"+self.img}

    def __eq__(self, other): 
        return self.id == other.id and self.name == other.name and self.company == other.company and self.date_manufacture == other.date_manufacture and self.img == other.img
