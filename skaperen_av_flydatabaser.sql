PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS "Flyselskap" (
	"flyselskapskode"	TEXT NOT NULL,
	"navn"	TEXT NOT NULL,
	PRIMARY KEY("flyselskapskode")
);
CREATE TABLE IF NOT EXISTS "Flyprodusent" (
	"navn"	TEXT NOT NULL,
	"nasjonalitet"	TEXT NOT NULL,
	"stiftelsesår"	INTEGER,
	PRIMARY KEY("navn")
);
CREATE TABLE IF NOT EXISTS "Flytype" (
	"navn"	TEXT NOT NULL,
	"start_produksjons_år"	INTEGER NOT NULL,
	"slutt_produksjons_år"	INTEGER,
	PRIMARY KEY("navn")
);
CREATE TABLE IF NOT EXISTS "Fordelsprogram" (
	"kundenummer"	INTEGER NOT NULL,
	"flyselsapskode"	TEXT NOT NULL,
	FOREIGN KEY("kundenummer") REFERENCES "Kunde"("kundenummer"),
	FOREIGN KEY("flyselsapskode") REFERENCES "Flyselskap"("flyselskapskode"),
	PRIMARY KEY("kundenummer","flyselsapskode")
);
CREATE TABLE IF NOT EXISTS "Delrute" (
	"flyrutenummer"	TEXT NOT NULL,
	"rekkefølge"	INTEGER NOT NULL,
	"fly_fra"	TEXT NOT NULL,
	"fly_til"	TEXT NOT NULL,
	"planlagt_ankomsttid"	TEXT NOT NULL,
	"planlagt_avgangstid"	TEXT NOT NULL,
	FOREIGN KEY("flyrutenummer") REFERENCES "Flyrute"("flyrutenummer"),
	FOREIGN KEY("fly_til") REFERENCES "Flyplass"("flyplasskode"),
	PRIMARY KEY("flyrutenummer","rekkefølge"),
	FOREIGN KEY("fly_fra") REFERENCES "Flyplass"("flyplasskode")
);
CREATE TABLE IF NOT EXISTS "Flyvning" (
	"løpenummer"	INTEGER NOT NULL,
	"flyrutenummer"	TEXT NOT NULL,
	"status"	TEXT NOT NULL,
	"dato"	TEXT NOT NULL,
	"fly_til_flyvning"	TEXT,
	FOREIGN KEY("flyrutenummer") REFERENCES "Flyrute"("flyrutenummer"),
	PRIMARY KEY("løpenummer","flyrutenummer"),
	FOREIGN KEY("fly_til_flyvning") REFERENCES "Fly"("registreringsnummer")
);
CREATE TABLE IF NOT EXISTS "Bagasje" (
	"registreringsnummer"	INTEGER NOT NULL,
	"vekt"	INTEGER NOT NULL,
	"innleveringstidspunkt"	TEXT NOT NULL,
	"innsjekket"	INTEGER NOT NULL,
	FOREIGN KEY("innsjekket") REFERENCES "Billett"("referansenummer"),
	PRIMARY KEY("registreringsnummer")
);
CREATE TABLE IF NOT EXISTS "Billett" (
	"referansenummer"	INTEGER NOT NULL,
	"pris"	INTEGER NOT NULL,
	"klasse"	TEXT NOT NULL,
	"reise_id"	INTEGER NOT NULL,
	"innsjekkingstidspunkt"	TEXT,
	"billett_for_flyrute"	TEXT NOT NULL,
	"billett_for_flyvning"	INTEGER NOT NULL,
	"eier"	INTEGER NOT NULL,
	"setevalg_rad"	INTEGER,
	"setevalg_flytype"	TEXT,
	"setenummer"	TEXT,
	PRIMARY KEY("referansenummer"),
	FOREIGN KEY("billett_for_flyvning", "billett_for_flyrute") REFERENCES "Flyvning"("løpenummer", "flyrutenummer"),
	FOREIGN KEY("setevalg_rad", "setevalg_flytype") REFERENCES "Rad"("radnummer", "flytypenavn"),
	FOREIGN KEY("eier") REFERENCES "Kunde"("kundenummer")
);
CREATE TABLE IF NOT EXISTS "Fly" (
	"registreringsnummer"	TEXT NOT NULL,
	"navn"	TEXT,
	"driftstart_år"	INTEGER NOT NULL,
	"flyselskap_flyflåte"	TEXT NOT NULL,
	FOREIGN KEY("flyselskap_flyflåte") REFERENCES "Flyselskap"("flyselskapskode"),
	PRIMARY KEY("registreringsnummer")
);
CREATE TABLE IF NOT EXISTS "Flyplass" (
	"flyplasskode"	TEXT NOT NULL,
	"navn"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("flyplasskode")
);
CREATE TABLE IF NOT EXISTS "Flyrute" (
	"flyrutenummer"	TEXT NOT NULL,
	"ukedagskode"	TEXT NOT NULL,
	"oppstartsdato"	TEXT NOT NULL,
	"sluttdato"	TEXT,
	"budsjett_pris"	INTEGER NOT NULL,
	"økonomi_pris"	INTEGER NOT NULL,
	"premium_pris"	INTEGER NOT NULL,
	"flyselskap_opererer"	TEXT NOT NULL,
	"flytype_navn"	TEXT NOT NULL,
	FOREIGN KEY("flytype_navn") REFERENCES "Flytype"("navn"),
	FOREIGN KEY("flyselskap_opererer") REFERENCES "Flyselskap"("flyselskapskode"),
	PRIMARY KEY("flyrutenummer")
);
CREATE TABLE IF NOT EXISTS "Innom" (
	"flyplasskode"	TEXT NOT NULL,
	"løpenummer"	INTEGER NOT NULL,
	"flyrutenummer"	TEXT NOT NULL,
	"fatisk_ankomstid"	TEXT,
	"faktisk_avgangstid"	TEXT,
	FOREIGN KEY("løpenummer", "flyrutenummer") REFERENCES "Flyvning"("løpenummer", "flyrutenummer")
	FOREIGN KEY("flyplasskode") REFERENCES "Flyplass"("flyplasskode"),
	PRIMARY KEY("flyrutenummer","flyplasskode","løpenummer")
);
CREATE TABLE IF NOT EXISTS "Kunde" (
	"kundenummer"	INTEGER NOT NULL,
	"navn"	TEXT NOT NULL,
	"telefonnummer"	TEXT NOT NULL,
	"e-postaddresse"	TEXT NOT NULL,
	"nasjonalitet"	TEXT NOT NULL,
	PRIMARY KEY("kundenummer" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "ProdusertAv" (
	"flyprodusent_navn"	TEXT NOT NULL,
	"flytype_navn"	TEXT NOT NULL,
	"registreringsnummer"	TEXT NOT NULL,
	"serienummer"	INTEGER NOT NULL,
	FOREIGN KEY("flyprodusent_navn") REFERENCES "Flyprodusent"("navn"),
	FOREIGN KEY("flytype_navn") REFERENCES "Flytype"("navn"),
	FOREIGN KEY("registreringsnummer") REFERENCES "Fly"("registreringsnummer") ON DELETE cascade ON UPDATE cascade,
	PRIMARY KEY("registreringsnummer")
);
CREATE TABLE IF NOT EXISTS "Rad" (
	"radnummer"	INTEGER NOT NULL,
	"flytypenavn"	TEXT NOT NULL,
	"seter_høyre"	TEXT NOT NULL,
	"seter_venstre"	TEXT NOT NULL,
	"nødutgang"	INTEGER NOT NULL,
	PRIMARY KEY("radnummer","flytypenavn"),
	FOREIGN KEY("flytypenavn") REFERENCES "Flytype"("navn")
);
