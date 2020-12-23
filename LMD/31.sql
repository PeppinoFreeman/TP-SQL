-- AJOUTE UNE NOUVELLE LIGNE DANS LA TABLE CATEGORIE 
-- (on utilise MERGE pour que l'insertion ne se fait qu'une seule fois)
MERGE INTO Ventes.dbo.Categorie AS Target
USING (
    SELECT 'Champignon' AS NomCategorie,
    'Champignons français' AS [Description] 
) source
ON Target.NomCategorie = source.NomCategorie
WHEN NOT MATCHED THEN 
    INSERT (NomCategorie,[Description])
        VALUES(source.NomCategorie,source.Description);

SELECT *
FROM Ventes.dbo.Categorie;