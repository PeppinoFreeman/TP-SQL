-- SUPPRIME LA CATEGORIE 'CHAMPIGNON' DE LA TABLE CATEGORIE
DELETE FROM Ventes.dbo.Categorie
WHERE NomCategorie = 'Champignon';

SELECT * 
From Ventes.dbo.Categorie;