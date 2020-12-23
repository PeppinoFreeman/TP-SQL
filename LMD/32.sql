-- AUGMENTE LE SALAIRE DE L'EMPLOYE 'LEVERLING' DE 20%
-- ET LUI ATTRIBUE UNE PRIME DE 2000
UPDATE Ventes.dbo.Employe
    SET Prime = 2000, SalaireActuel = SalaireActuel*1.2
WHERE Employe.Nom = 'Leverling';

SELECT *
FROM Ventes.dbo.Employe
WHERE Employe.Nom = 'Leverling';
