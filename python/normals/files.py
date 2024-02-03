file=open('/workspaces/Trials/python/country.txt','r')
# print(file.readline())
for f in file.readlines():
    print(f)
file.close()