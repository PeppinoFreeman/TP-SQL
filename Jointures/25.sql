-- AFFICHE LES EMPLOYES DE LA DIVISION EUROPE
SELECT *
FROM Ventes.dbo.Employe as Em
    JOIN Ventes.dbo.Division as Div on Em.DivisionId = Div.DivisionId
WHERE Div.NomDivision = 'Europe'; 