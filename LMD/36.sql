-- ATTRIBUE UNE PRIME DE 350 AUX SALARIES AVEC UN 
-- CA > 50 000 EN 1999
UPDATE Ventes.dbo.Employe
    SET Prime = 350
FROM (
SELECT Em.EmployeId, SUM(Lc.Quantite * Lc.PrixUnitaire) AS 'Chiffre d''affaire'
FROM Employe as Em
	JOIN Commande as Co On Em.EmployeId = Co.EmployeId
	JOIN LigneCommandes as Lc On Co.CommandeId = Lc.CommandeId 
WHERE Co.DateCommande BETWEEN'19990101' AND '19991231 23:59:59'
GROUP BY Em.EmployeId
HAVING SUM(Lc.Quantite * Lc.PrixUnitaire)>50000
) AS Ep
WHERE Employe.EmployeId = Ep.EmployeId; 


SELECT EmployeId,Prime
FROM Employe;
