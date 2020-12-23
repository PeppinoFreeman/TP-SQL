-- AFFICHE L'ID DE CHAQUE EMPLPYE AVEC SON SALAIRE MAX
SELECT EmployeId, MAX(Salaire) as 'Salaire maximum'
FROM Ventes.dbo.HistoriqueSalaires
GROUP BY EmployeId;