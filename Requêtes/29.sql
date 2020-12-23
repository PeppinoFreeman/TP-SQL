-- AFFICHE LE NOMBRE DE CLIENT PAR PAYS 
SELECT Pays, COUNT(*) AS 'Nombre de clients'
FROM Ventes.dbo.Client
GROUP BY Pays;