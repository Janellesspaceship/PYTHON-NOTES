import sqlite3

# Connect to database
conn = sqlite3.connect("python.db")
cursor = conn.cursor()

# Create table
cursor.execute("""
CREATE TABLE IF NOT EXISTS users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT,
    score INTEGER,
    risk_level TEXT
)
""")

# Insert data
cursor.execute("""
INSERT INTO users(name, email, score, risk_level)
VALUES (?, ?, ?, ?)
""", ("Janelle", "j@gmail.com", 15, "Manageable"))

# Save changes
conn.commit()

# Close connection
conn.close()

print("Data inserted successfully!")




conn = sqlite3.connect("company.db")
cursor = conn.cursor()

conn.commit()
conn.close()


