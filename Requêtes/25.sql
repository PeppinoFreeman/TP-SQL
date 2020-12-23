-- AFFICHE L'ID DE CHAQUE EMPLOYE AVEC SON SALAIRE MIN
-- ORDONNE PAR ORDRE CROISSANT
SELECT EmployeId, MIN(Salaire) as 'Salaire minimum'
FROM Ventes.dbo.HistoriqueSalaires
GROUP BY EmployeId
ORDER BY 'Salaire minimum';