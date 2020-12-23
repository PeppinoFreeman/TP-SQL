-- AJOUTE DES ENTREES DANS LA TABLE TRANSPORTEURS
-- (on utilise MERGE pour que l'insertion ne se fait qu'une seule fois) 
MERGE INTO Ventes.dbo.Transporteur AS Target
USING (
    SELECT '11'AS TransporteurId,
    'Livraison rapide' AS NomSociete, 
    '(0033)123456789' AS Telephone 
) source
ON Target.TransporteurId = source.TransporteurId
WHEN NOT MATCHED THEN 
    INSERT (NomSociete,Telephone)
        VALUES(source.NomSociete,source.Telephone);

MERGE INTO Ventes.dbo.Transporteur AS Target
USING (
    SELECT '12'AS TransporteurId,
    'Leader Transporter''' AS NomSociete, 
    '(0141)9876543' AS Telephone 
) source
ON Target.TransporteurId = source.TransporteurId
WHEN NOT MATCHED THEN 
    INSERT (NomSociete,Telephone)
        VALUES(source.NomSociete,source.Telephone);

MERGE INTO Ventes.dbo.Transporteur AS Target
USING (
    SELECT 'Safe Transport' AS NomSociete
) source
ON Target.NomSociete = source.NomSociete
WHEN NOT MATCHED THEN 
    INSERT (NomSociete)
        VALUES(source.NomSociete);

SELECT *
FROM Ventes.dbo.Transporteur;