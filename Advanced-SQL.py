import sqlite3

conn = sqlite3.connect("HumanitarianProgram.db")
cursor = conn.cursor()

print("Database opened successfully!")