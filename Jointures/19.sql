-- AFFICHE LES COMMANDES FAIT PAR DES CLIENTS
SELECT *
FROM Ventes.dbo.Client as Cl
    JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId;