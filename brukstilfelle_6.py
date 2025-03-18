import sqlite3

from main import PLANE_DATABASE_NAME

class Flyrute_Entries:
    def __init__(self):
        pass
    flyplasskode = ""
    flyruter  = {}

    def add_flight_route(self, flyrutenummer, flyplasser, ankomsttid, avgangstid):
        self.flyruter[flyrutenummer] = {"flyplasser": flyplasser, "ankomsttid": ankomsttid, "avgangstid": avgangstid}

    def print(self):
        columns_list = ["Flyrutenummer", "Flyplasser", f"Ankomsttid for {self.flyplasskode}", f"Avgangstid for {self.flyplasskode}"]
        print(f"""
Flyruter for {self.flyplasskode}
Flyrutenummer | Flyplasser | Ankomsttid for {self.flyplasskode} | Avgangstid for {self.flyplasskode}
              """)
        for item, value in self.flyruter.items():
            if value["ankomsttid"] == None:
                value["ankomsttid"] = "None "
            if value["avgangstid"] == None:
                value["avgangstid"] = "None "

            print(item, end="   |   ")
            print(value["flyplasser"], end="    |   ")
            print(value["ankomsttid"], end="    |   ")
            print(value["avgangstid"])




def query_for_available_flights(airport_code, ukedag, avgang_ankomst):
    with sqlite3.connect(PLANE_DATABASE_NAME) as database:
        cursor = database.cursor()

        # Rekkefølge på kolonner: 
        # 0: flyrutenummer, 
        # 1: Liste med avganger på formatet: "Flyplasskode hh:mm" separert med komma, 
        # 2:  Liste med ankomster på formatet: "Flyplasskode hh:mm" separert med komma 
        query = f"""
                SELECT 
                Flyrute.flyrutenummer,
                group_concat(DISTINCT Flyplass_fra.flyplasskode || ' ' || Delrute.planlagt_avgangstid), 
                group_concat(DISTINCT Flyplass_til.flyplasskode || ' ' || Delrute.planlagt_ankomsttid)
                FROM Flyrute
                INNER JOIN Delrute USING (flyrutenummer)
                INNER JOIN Flyplass AS Flyplass_til ON (Delrute.fly_til = Flyplass_til.flyplasskode)
                INNER JOIN Flyplass AS Flyplass_fra ON (Delrute.fly_fra = Flyplass_fra.flyplasskode)
                WHERE (Flyplass_til.flyplasskode = "{airport_code}" OR Flyplass_fra.flyplasskode = "{airport_code}") AND Flyrute.ukedagskode LIKE "%{ukedag}%"
                GROUP BY Flyrute.flyrutenummer
                """
        cursor.execute(query)
        results = cursor.fetchall()
        output = []

        flyrute_entries = Flyrute_Entries()
        flyrute_entries.flyplasskode = airport_code
        
        for result in results:
            fra = []
            fra_tid = None
            flyrutenummer = result[0]

            fly_fra_list = result[1].split(',')
            for fly_fra in fly_fra_list:
                fly_fra_split = fly_fra.split()
                
                if (fly_fra_split[0] not in fra):
                    fra.append(fly_fra_split[0])

                if (fly_fra_split[0] == airport_code):
                    fra_tid = fly_fra_split[1]
                
            til = []
            til_tid = None
            fly_til_list = result[2].split(',')
            for fly_til in fly_til_list:
                fly_til_split = fly_til.split()
                
                if (fly_til_split[0] not in til):
                    til.append(fly_til_split[0])

                if (fly_til_split[0] == airport_code):
                    til_tid = fly_til_split[1]

            in_fra = airport_code in fra
            in_til = airport_code in til
        
            if avgang_ankomst == 'avgang' and not in_til:
                continue
            if avgang_ankomst == 'ankomst' and not in_fra:
                continue
            if avgang_ankomst == 'begge' and not (in_til or in_fra):
                continue

            innom = fra + list(set(til) - set(fra))
            flyrute_entries.add_flight_route(flyrutenummer, innom, til_tid, fra_tid)
            output.append([flyrutenummer, innom, til_tid, fra_tid])

        flyrute_entries.print()
        return output
        

def check_if_row_exists(table_name: str, column_name: str, value: str) -> bool:
    with sqlite3.connect(PLANE_DATABASE_NAME) as database:
        cursor = database.cursor()
        query = f'SELECT * FROM {table_name} WHERE {column_name} =?'

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

def ask_for_ukedag() -> str:
    while(True):
        ukedag_input = input("Skriv inn ukedag (1-7): ")
        
        ukedag_tall = None
        try:
            ukedag_tall = int(ukedag_input)
        except:
            print("Ugyldig ukedag!")
            continue
        

        if (ukedag_tall > 0 and ukedag_tall < 8):
            return ukedag_input
        else:
            print("Ugyldig ukedag!")


def ask_for_avgang_ankomst() -> str:
    while(True): 
        try:
            avgang_ankomst_input =  int(input("Skriv inn 0: avgang/ 1: ankomst/ 2: begge: "))
        except (Exception):
            print("Invalid input")
            return
            
        valid_str = ["avgang", "ankomst", "begge"]
        


        if (avgang_ankomst_input >= 0 and avgang_ankomst_input <3):
            return valid_str[avgang_ankomst_input]
        else:
            print("Ugyldig valg!")


def main():
    airport_code = ask_for_airport()
    ukedag = ask_for_ukedag()
    avgang_ankomst = ask_for_avgang_ankomst()
    output = query_for_available_flights(airport_code, ukedag, avgang_ankomst)

if __name__ == "__main__":
    main()