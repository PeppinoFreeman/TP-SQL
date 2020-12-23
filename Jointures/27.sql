-- AFFICHE LE CA DE CHAQUE CATEGORIE
SELECT ct.NomCategorie, SUM(PrixUnitaire) AS 'Chiffre d''Affaires'
FROM Ventes.dbo.Categorie AS ct
    JOIN Ventes.dbo.Produit AS prod ON ct.CategorieId = prod.CategorieId
GROUP BY ct.NomCategorie;
