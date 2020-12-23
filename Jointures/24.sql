-- AFFICHE LES COMMANDES PASSEE PAR LE CLIENT AVEC L'ID OTTIK 
-- OU DANS LA VILLE DE PARIS (JUSTE LA TABLE DES COMMANDES ET
-- LA VILLE DE LA TABLE CLIENT)
SELECT Co.*, Cl.Ville
FROM Ventes.dbo.Client as Cl
    JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId
    WHERE Co.ClientId = 'OTTIK' OR Cl.Ville = 'Paris';