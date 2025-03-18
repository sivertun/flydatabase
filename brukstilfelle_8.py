import sqlite3

from main import PLANE_DATABASE_NAME

    

def check_if_flights_exist(route) -> bool:
    with sqlite3.connect(PLANE_DATABASE_NAME) as database:
        cursor = database.cursor()
        query = f'SELECT * FROM Flyrute INNER JOIN Flyvning USING (flyrutenummer) WHERE flyrutenummer = "{route}"'

        cursor.execute(query)
        flight = cursor.fetchone()
            
        if (flight is None):
            return False
        else:
            return True

def ask_for_route() -> str:
    while(True):
        flight_input = input("Skriv inn flyrutenummer: ")
        
        if (check_if_flights_exist(flight_input)):
            return flight_input
        else:
            print("Ugyldig flyrutenummer!")

def ask_for_date(route: str) -> int:
    with sqlite3.connect(PLANE_DATABASE_NAME) as database:
        cursor = database.cursor()
        query = f"SELECT løpenummer, dato FROM Flyvning WHERE flyrutenummer = \"{route}\""
        
        cursor.execute(query)
        results = cursor.fetchall()

        sequence_numbers = []
        dates = []
        options = ""

        for result in results:
            sequence_numbers.append(result[0])
            dates.append(result[1])
            options += f"{result[0]}: {result[1]} / "

        options = options[0:-3]

        while True:
            try:
                sequence_number = int(input(f"Velg dato for flyvningen ({options}): "))
                if sequence_number in sequence_numbers:
                    return sequence_number
            except:
                pass
            print('Ugyldig dato')
        
def query_for_available_seats(route: str, sequence_number: int):
    with sqlite3.connect(PLANE_DATABASE_NAME) as database:
        cursor = database.cursor()

        query_for_already_reserved_seats =  f"""
                                            SELECT Billett.setevalg_rad, Billett.setenummer
                                            FROM Billett
                                            INNER JOIN Flyvning ON (Billett.billett_for_flyrute = Flyvning.flyrutenummer AND Billett.billett_for_flyvning = Flyvning.løpenummer)
                                            WHERE Flyvning.flyrutenummer = "{route}" AND Flyvning.løpenummer = "{sequence_number}"
                                            """
        
        cursor.execute(query_for_already_reserved_seats)
        reserved_seats = cursor.fetchall()

        query_for_getting_all_seats_for_route = f""" 
                                            SELECT Rad.radnummer, Rad.seter_venstre || Rad.seter_høyre
                                            FROM Flyrute
                                            INNER JOIN Flytype ON (Flytype.navn = Flyrute.flytype_navn)
                                            INNER JOIN Rad ON (Flytype.navn = Rad.flytypenavn)
                                            WHERE Flyrute.flyrutenummer = "{route}"
                                            """
        
        cursor.execute(query_for_getting_all_seats_for_route)
        seats_for_route = cursor.fetchall()
        
        seats = []
        for i in range(0, len(seats_for_route)):
            for c in seats_for_route[i][1]:
                seats.append(tuple([i + 1, ord(c) - ord("A") + 1]))
        return [item for item in seats if item not in reserved_seats]

def print_available_seats(seats):
    output = ["" for _ in range(seats[-1][0])]

    for seat in seats:
        output[seat[0] - 1] += str(chr(seat[1] + ord("A") - 1))

    print("Ledige seter:")
    for row in range(0, len(output)):
        if output[row] != "":
            print(f"Row {row + 1}: {output[row]}")

def main():
    route = ask_for_route()
    sequence_number = ask_for_date(route)
    output = query_for_available_seats(route, sequence_number)
    print_available_seats(output)
    

if __name__ == "__main__":
    main()