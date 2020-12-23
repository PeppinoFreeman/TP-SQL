-- AFFICHE LES CLIENTS ID AVEC UN CHIFFRE D'AFFAIRE CUMULE > 1000
SELECT ClientId, SUM(Transport) as 'CA Transport'
FROM Ventes.dbo.Commande
GROUP BY ClientId
    HAVING SUM(Transport)>1000
ORDER BY 'CA Transport' DESC
