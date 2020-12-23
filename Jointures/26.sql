-- AFFICHE LE NOMBRE D'EMPLOYES PAR DIVISION
SELECT Div.NomDivision,Count(*) AS 'Nombre d''employés par division'
FROM Ventes.dbo.Employe as Em
    JOIN Ventes.dbo.Division as Div on Em.DivisionId = Div.DivisionId
GROUP BY Div.NomDivision;