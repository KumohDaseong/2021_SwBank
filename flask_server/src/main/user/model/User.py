class User():
    def __init__(self, id, pwd, name, p_number ,m_type):
        self.id = id
        self.pwd = pwd
        self.name = name
        self.p_number = p_number
        self.m_type = m_type
    def __str__(self):
        return "id: {0}, pwd: {1}, name: {2}, p_number: {3}, m_type: {4}".format(self.id, self.pwd, self.name, self.p_number, self.m_type)