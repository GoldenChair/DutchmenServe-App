import pymssql
 
server = 'portal.lvc.edu'
database = 'CommunityService'
username = 'lvc\service_compsci'
password = 'Heart162'

cnxn = pymssql.connect(server=server,
                      database=database,
                      user=username,
                      password=password)

cursor = cnxn.cursor()
cursor.execute('SELECT * FROM csProjects;')
row = cursor.fetchone()
while row:
    print(row[0])
    row = cursor.fetchone()