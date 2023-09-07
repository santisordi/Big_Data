import sqlite3

square = lambda n: n*n

conn = sqlite3.connect("northwing.db")
conn.create_function("square", 1, square)

cursor = conn.cursor()
cursor.execute('''
    SELECT * FROM Products
    ''')

results = cursor.fetchall() 
print(results)