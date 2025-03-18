INSERT INTO Flyplass (navn, flyplasskode)
VALUES
    ("Bodø Lufthavn", "BOO"),
    ("Bergen Lufthavn", "BGO"),
    ("Oslo Lufthavn", "OSL"),
    ("Stavanger Lufthavn", "SVG"),
    ("Trondheim Lufthavn", "TRD");


INSERT INTO Flyselskap (navn, flyselskapskode)
VALUES
    ("Norwegian", "DY"),
    ("SAS", "SK"),
    ("Widerøe", "WF");

INSERT INTO Flyprodusent (navn, nasjonalitet, stiftelsesår)
VALUES 
    ("The Boeing Company", "us", NULL),
    ("Airbus Group", "fr-de-es-uk", NULL),
    ("De Havilland Canada", "ca", NULL);
    

INSERT INTO Flytype (navn, start_produksjons_år, slutt_produksjons_år)
VALUES 
    ("Boeing 737 800", 1997, 2020),
    ("Airbus a320neo", 2016, NULL),
    ("Dash-8 100", 1984, 2005);

INSERT INTO Fly (registreringsnummer, navn, driftstart_år, flyselskap_flyflåte) 
VALUES
    ("LN-ENU", NULL, 2015, "DY"),
    ("LN-ENR", NULL, 2018, "DY"),
    ("LN-NIQ", NULL, 2011, "DY"),
    ("LN-ENS", NULL, 2017, "DY"),
    ("SE-RUB", "Birger Viking", 2020, "SK"),
    ("SE-DIR", "Nora Viking", 2023, "SK"),
    ("SE-RUP", "Ragnhild Viking", 2024, "SK"),
    ("SE-RZE", "Ebbe Viking", 2024, "SK"),
    ("LN-WIH", "Oslo", 1994, "WF"),
    ("LN-WIA", "Nordland", 1993, "WF"),
    ("LN-WIL", "Narvik", 1995, "WF");

INSERT INTO ProdusertAv (flyprodusent_navn, flytype_navn, registreringsnummer, serienummer)
VALUES 
    ("The Boeing Company", "Boeing 737 800", "LN-ENU", 42069),
    ("The Boeing Company", "Boeing 737 800", "LN-ENR", 42093),
    ("The Boeing Company", "Boeing 737 800", "LN-NIQ", 39403),
    ("The Boeing Company", "Boeing 737 800", "LN-ENS", 42281),
    ("Airbus Group", "Airbus a320neo", "SE-RUB", 9518),
    ("Airbus Group", "Airbus a320neo", "SE-DIR", 11421),
    ("Airbus Group", "Airbus a320neo", "SE-RUP", 12066 ),
    ("Airbus Group", "Airbus a320neo", "SE-RZE", 12166),
    ("De Havilland Canada", "Dash-8 100", "LN-WIH", 383),
    ("De Havilland Canada", "Dash-8 100", "LN-WIA", 359),
    ("De Havilland Canada", "Dash-8 100", "LN-WIL", 298);
    
INSERT INTO Rad (radnummer, flytypenavn, seter_venstre,  seter_høyre, nødutgang)
VALUES
    (1, "Boeing 737 800", "ABC", "DEF", 0),
    (2, "Boeing 737 800", "ABC", "DEF", 0),
    (3, "Boeing 737 800", "ABC", "DEF", 0),
    (4, "Boeing 737 800", "ABC", "DEF", 0),
    (5, "Boeing 737 800", "ABC", "DEF", 0),
    (6, "Boeing 737 800", "ABC", "DEF", 0),
    (7, "Boeing 737 800", "ABC", "DEF", 0),
    (8, "Boeing 737 800", "ABC", "DEF", 0),
    (9, "Boeing 737 800", "ABC", "DEF", 0),
    (10, "Boeing 737 800", "ABC", "DEF", 0),
    (11, "Boeing 737 800", "ABC", "DEF", 0),
    (12, "Boeing 737 800", "ABC", "DEF", 0),
    (13, "Boeing 737 800", "ABC", "DEF", 1),
    (14, "Boeing 737 800", "ABC", "DEF", 0),
    (15, "Boeing 737 800", "ABC", "DEF", 0),
    (16, "Boeing 737 800", "ABC", "DEF", 0),
    (17, "Boeing 737 800", "ABC", "DEF", 0),
    (18, "Boeing 737 800", "ABC", "DEF", 0),
    (19, "Boeing 737 800", "ABC", "DEF", 0),
    (20, "Boeing 737 800", "ABC", "DEF", 0),
    (21, "Boeing 737 800", "ABC", "DEF", 0),
    (22, "Boeing 737 800", "ABC", "DEF", 0),
    (23, "Boeing 737 800", "ABC", "DEF", 0),
    (24, "Boeing 737 800", "ABC", "DEF", 0),
    (25, "Boeing 737 800", "ABC", "DEF", 0),
    (26, "Boeing 737 800", "ABC", "DEF", 0),
    (27, "Boeing 737 800", "ABC", "DEF", 0),
    (28, "Boeing 737 800", "ABC", "DEF", 0),
    (29, "Boeing 737 800", "ABC", "DEF", 0),
    (30, "Boeing 737 800", "ABC", "DEF", 0),
    (31, "Boeing 737 800", "ABC", "DEF", 0),
    (1, "Airbus a320neo", "ABC", "DEF", 0),
    (2, "Airbus a320neo", "ABC", "DEF", 0),
    (3, "Airbus a320neo", "ABC", "DEF", 0),
    (4, "Airbus a320neo", "ABC", "DEF", 0),
    (5, "Airbus a320neo", "ABC", "DEF", 0),
    (6, "Airbus a320neo", "ABC", "DEF", 0),
    (7, "Airbus a320neo", "ABC", "DEF", 0),
    (8, "Airbus a320neo", "ABC", "DEF", 0),
    (9, "Airbus a320neo", "ABC", "DEF", 0),
    (10, "Airbus a320neo", "ABC", "DEF", 0),
    (11, "Airbus a320neo", "ABC", "DEF", 1),
    (12, "Airbus a320neo", "ABC", "DEF", 1),
    (13, "Airbus a320neo", "ABC", "DEF", 0),
    (14, "Airbus a320neo", "ABC", "DEF", 0),
    (15, "Airbus a320neo", "ABC", "DEF", 0),
    (16, "Airbus a320neo", "ABC", "DEF", 0),
    (17, "Airbus a320neo", "ABC", "DEF", 0),
    (18, "Airbus a320neo", "ABC", "DEF", 0),
    (19, "Airbus a320neo", "ABC", "DEF", 0),
    (20, "Airbus a320neo", "ABC", "DEF", 0),
    (21, "Airbus a320neo", "ABC", "DEF", 0),
    (22, "Airbus a320neo", "ABC", "DEF", 0),
    (23, "Airbus a320neo", "ABC", "DEF", 0),
    (24, "Airbus a320neo", "ABC", "DEF", 0),
    (25, "Airbus a320neo", "ABC", "DEF", 0),
    (26, "Airbus a320neo", "ABC", "DEF", 0),
    (27, "Airbus a320neo", "ABC", "DEF", 0),
    (28, "Airbus a320neo", "ABC", "DEF", 0),
    (29, "Airbus a320neo", "ABC", "DEF", 0),
    (30, "Airbus a320neo", "ABC", "DEF", 0),
    (1, "Dash-8 100", "", "CD", 0),
    (2, "Dash-8 100", "AB", "CD", 0),
    (3, "Dash-8 100", "AB", "CD", 0),
    (4, "Dash-8 100", "AB", "CD", 0),
    (5, "Dash-8 100", "AB", "CD", 1),
    (6, "Dash-8 100", "AB", "CD", 0),
    (7, "Dash-8 100", "AB", "CD", 0),
    (8, "Dash-8 100", "AB", "CD", 0),
    (9, "Dash-8 100", "AB", "CD", 0),
    (10, "Dash-8 100", "AB", "CD", 0);


INSERT INTO Flyrute (flyrutenummer, ukedagskode, oppstartsdato, budsjett_pris, økonomi_pris, premium_pris, flyselskap_opererer, flytype_navn)
VALUES
    ("WF1311", "12345", "2025-01-01", 599, 899, 2018, "WF", "Dash-8 100"),
    ("WF1302", "12345", "2025-01-01", 599, 899, 2018, "WF", "Dash-8 100"),
    ("DY753", "1234567", "2025-01-01", 500, 1000, 1500, "DY", "Boeing 737 800"),
    ("SK332", "1234567", "2025-01-01", 500, 1000, 1500, "SK", "Airbus a320neo"),
    ("SK888(1)", "12345", "2025-01-01", 800, 1500, 2000, "SK", "Airbus a320neo"),
    ("SK888(2)", "12345", "2025-01-01", 350, 700, 1000, "SK", "Airbus a320neo"),
    ("SK888", "12345", "2025-01-01", 1000, 1700, 2200, "SK", "Airbus a320neo");

INSERT INTO Delrute (flyrutenummer, rekkefølge, fly_fra, fly_til, planlagt_ankomsttid, planlagt_avgangstid)
VALUES
    ("WF1311", 1, "TRD", "BOO", "16:20", "15:15"),
    ("WF1302", 1, "BOO", "TRD", "08:40", "07:35"),
    ("DY753", 1, "TRD", "OSL", "11:15", "10:20"),
    ("SK332", 1, "OSL", "TRD", "09:05", "08:00"),
    ("SK888(1)", 1, "TRD", "BGO", "11:10", "10:00"),
    ("SK888(2)", 1, "BGO", "SVG", "12:10", "11:40"),
    ("SK888", 1, "TRD", "BGO", "11:10", "10:00"),
    ("SK888", 2, "BGO", "SVG", "12:10", "11:40");
    
INSERT INTO Flyvning (løpenummer, flyrutenummer, "status", dato, fly_til_flyvning)
VALUES 
    (1, "WF1302", "planned", "2025-04-01", NULL),
    (1, "DY753", "planned", "2025-04-01", NULL),
    (1, "SK888", "planned", "2025-04-01", NULL),
    (1, "SK888(1)", "planned", "2025-04-01", NULL),
    (1, "SK888(2)", "planned", "2025-04-01", NULL);

INSERT INTO Innom (flyplasskode, løpenummer, flyrutenummer)
VALUES
    ("BOO", 1, "WF1302"),
    ("TRD", 1, "WF1302"),
    ("TRD", 1, "DY753"),
    ("OSL", 1, "DY753"),
    ("TRD", 1, "SK888(1)"),
    ("BGO", 1, "SK888(1)"),
    ("BGO", 1, "SK888(2)"),
    ("SVG", 1, "SK888(2)"),
    ("TRD", 1, "SK888"),
    ("BGO", 1, "SK888"),
    ("SVG", 1, "SK888");

INSERT INTO Kunde (kundenummer, navn, telefonnummer, "e-postaddresse", nasjonalitet)
VALUES
    (1, "Mr kunde", "+4749494949", "example@gmail.com", "no");

INSERT INTO Billett (referansenummer, pris, klasse, reise_id, innsjekkingstidspunkt, billett_for_flyrute, billett_for_flyvning, eier, setevalg_flytype, setevalg_rad, setenummer)
VALUES
    (1, 2018, "premium", 1, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 1, 3),
    (2, 2018, "premium", 2, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 1, 4),
    (3, 599, "budsjett", 3, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 2, 1),
    (4, 599, "budsjett", 4, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 2, 2),
    (5, 599, "budsjett", 5, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 2, 3),
    (6, 599, "budsjett", 6, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 2, 4),
    (7, 599, "budsjett", 7, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 3, 1),
    (8, 599, "budsjett", 8, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 3, 2),
    (9, 599, "budsjett", 9, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 3, 3),
    (10, 599, "budsjett", 10, "2025-04-01-10:15", "WF1302", 1, 1, "Dash-8 100", 3, 4);