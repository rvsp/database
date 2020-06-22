import mysql.connector

# from mysql import connector

myDB = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    password = '',
    database = 'database_name'

)

myCursor = myDB.cursor()
# print(myCursor)

# myCursor.execute("""
# select c.name as Country,cy.name as City, c.continent, c.region 
# from country c, city cy where c.code in ('AUS','BEN') and c.code=cy.CountryCode
# """)

# result  = myCursor.fetchone()
# result  = myCursor.fetchall()
# print(result)

# for x in myCursor:
#     print(x)

# myCursor.execute('show tables')

# myCursor.execute("""
# CREATE TABLE stud_details (
#   id int DEFAULT NULL,
#   firstname varchar(30) DEFAULT NULL,
#   lastname varchar(20) DEFAULT NULL,
#   mobile varchar(10),
#   email varchar(40)
# );
# """)

# myCursor.execute('show tables')
# result = myCursor.fetchall()
# print(result)

sql = '''
INSERT INTO stud_details (id,firstname,lastname,mobile,email)
VALUES (%s,%s,%s,%s,%s)
'''

values = (1,'vinitha','v','6541321','vinitha@mail.com')


myCursor.execute(sql,values)

# gets no of rows affected
print(myCursor.rowcount)

myDB.commit()


