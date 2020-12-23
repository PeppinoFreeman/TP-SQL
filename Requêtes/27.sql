-- AFFICHE L'ID DE CHAQUE EMPLOYE AVEC SON SALAIRE CUMULE
SELECT EmployeId, SUM(Salaire) as 'Salaire cumulé'
FROM Ventes.dbo.HistoriqueSalaires
GROUP BY EmployeId
ORDER BY 'Salaire cumulé';