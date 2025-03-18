import sqlite3
import os

PLANE_DATABASE_NAME = "flyselskap.db"

def create_database():
    if (not os.path.exists(PLANE_DATABASE_NAME)):
        # Create database
        with sqlite3.connect(PLANE_DATABASE_NAME) as database:
            cursor = database.cursor()
            
            with open('build.sql', 'r') as sql_file:
                sql_script = sql_file.read()
                cursor.executescript(sql_script)
                database.commit()

            with open('seed.sql', 'r') as sql_file:
                sql_script = sql_file.read()
                cursor.executescript(sql_script)
                database.commit()


def main():
    create_database()
    


if __name__ == "__main__":
    main()