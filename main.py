import pymysql.cursors

# Connect to the database
connection = pymysql.connect(
    host='localhost',
    user='root',
    password='ANSKk08aPEDbFjDO',
    database='testing',
    cursorclass=pymysql.cursors.DictCursor
)

with connection:
    with connection.cursor() as cursor:
        # Read a single record
        sql = "SELECT * FROM `users`"
        cursor.execute(sql)
        result = cursor.fetchall()
        print(result)
