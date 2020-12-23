-- AFFICHE LES COMMANDES PASSEE PAR LE CLIENT AVEC L'ID OTTIK 
-- (JUSTE LA TABLE DES COMMANDES)
SELECT Co.*
FROM Ventes.dbo.Client as Cl
    JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId
    WHERE Co.ClientId = 'OTTIK';