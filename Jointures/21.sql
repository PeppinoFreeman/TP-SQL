-- AFFICHE LES CLIENTS SANS COMMANDES 
-- (JUSTE LA TABLE CLIENT)
SELECT Cl.*
FROM Ventes.dbo.Client as Cl
    LEFT JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId
WHERE Co.ClientId IS NULL;