SELECT Flyselskap.navn AS "flyselskap", Flytype.navn AS "flytype", COUNT(Fly.registreringsnummer) AS "antall_fly"
FROM Flyselskap
INNER JOIN Fly ON Fly.flyselskap_flyflåte = Flyselskap.flyselskapskode
INNER JOIN ProdusertAv USING (registreringsnummer)
INNER JOIN Flytype ON Flytype.navn = ProdusertAv.flytype_navn
GROUP BY Flytype