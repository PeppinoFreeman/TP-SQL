-- AFFICHE L'ID DE CHAQUE EMPLOYE AVEC SON SALAIRE MOYEN
SELECT EmployeId, AVG(Salaire) as 'Salaire moyen'
FROM Ventes.dbo.HistoriqueSalaires
GROUP BY EmployeId;