import sqlite3
import os

from main import PLANE_DATABASE_NAME

def check_if_row_exists(table_name: str, column_name: str, value: str) -> bool:
    with sqlite3.connect(PLANE_DATABASE_NAME) as database:
        cursor = database.cursor()
        query = f'SELECT * FROM {table_name} WHERE {column_name} =?'
        print(query)
        cursor.execute(query, (value,))
        airport = cursor.fetchone()
            
        if (airport is None):
            return False
        else:
            return True
            
def ask_for_airport() -> str:
    while(True):
        airport_input = input("Skriv inn flyplass-kode: ")
        
        if (check_if_row_exists("Flyplass", "flyplasskode", airport_input)):
            return airport_input
        else:
            print("Ugyldig flyplass-navn!")




def main():
    airport_name = ask_for_airport()
    print(airport_name)
    ukedag = input("Skriv inn ukedag: ")
    avgang = input("")

if __name__ == "__main__":
    main()