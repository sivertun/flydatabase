
SELECT "Flyselskap.navn" AS "flyselskap", "Flytype.navn" AS "flytype", COUNT("Fly.registreringsnummer") AS "fly"
FROM "Flyselskap"
INNER JOIN "Fly" ON "Flyselskap.flyselsapskode" = "Fly.flyselskap_flyflåte"
INNER JOIN "ProdusertAv" ON "Fly.registreringsnummer" = "ProdusertAv.registreringsnummer"
INNER JOIN "Flytype" ON "Flytype.navn" = "ProdusertAv.flytype_navn"
GROUP BY "Flytype"