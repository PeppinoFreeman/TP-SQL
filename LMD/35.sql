-- SUPPRIME LES TRANSPORTEURS CREES DANS 
-- L'OPERATION PRECEDENTE
DELETE FROM Ventes.dbo.Transporteur
WHERE NomSociete IN ('Livraison rapide','Leader Transporter''','Safe Transport');

SELECT * 
From Ventes.dbo.Transporteur;