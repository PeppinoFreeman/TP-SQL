-- CREER UNE VUE DU CHIFFRE D'AFFAIRE ANNUEL DE CHAQUE EMPLOYE  
CREATE OR ALTER VIEW CA_ANNUEL_EMPLOYE
AS 
SELECT Em.EmployeId,YEAR(Co.DateCommande) AS 'Année' , SUM(Lc.Quantite * Lc.PrixUnitaire) AS 'Chiffre d''affaire'
FROM Employe as Em
	JOIN Commande as Co On Em.EmployeId = Co.EmployeId
	JOIN LigneCommandes as Lc On Co.CommandeId = Lc.CommandeId 
GROUP BY YEAR(Co.DateCommande), Em.EmployeId;
