class my:
    def __init__(self,name,age):
        self.name=name
        self.age=age
    
    def prints(self):
        print('hello '+self.name+' and age is ',self.age)

p=my('meow',12)
p.prints()