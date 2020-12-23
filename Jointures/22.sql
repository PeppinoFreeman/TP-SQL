-- AFFICHE TOUS LES CLIENTS Y COMPRIS CEUX SANS COMMANDE
SELECT *
FROM Ventes.dbo.Client as Cl
    LEFT JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId;