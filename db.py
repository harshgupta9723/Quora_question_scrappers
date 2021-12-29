import os
import mysql.connector


db = mysql.connector.connect(
    host = os.getenv("host"),
    user = os.getenv("user"),
    password = os.getenv("password"),
    database = os.getenv("database")
)


cursor = db.cursor()
#cursor.execute('CREATE TABLE quora_questions (id INT AUTO_INCREMENT PRIMARY KEY, questions VARCHAR(255));')

class DB:

    def fetch_Q(self):

        cursor.execute('SELECT questions from quora_questions;')
        q_li = cursor.fetchall()
        #cursor.close()
        #db.close()

        return q_li