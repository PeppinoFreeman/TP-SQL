-- AFFICHE LES COMMANDES DE L'EMPLOYE MARIANNE 
-- (JUSTE LA TABLE COMMANDE)
SELECT Co.*
FROM Ventes.dbo.Employe as Em
    JOIN Ventes.dbo.Commande as Co on Em.EmployeId = Co.EmployeId
WHERE Em.Nom ='Marianne' OR Em.Prenom='Marianne';