-- CREE UNE VUE PRODUIT_EN_RUPTURE 
CREATE OR ALTER VIEW PRODUIT_EN_RUPTURE
AS 
SELECT Prod.ProduitId, Prod.NomProduit, Fo.ContactNom AS NomFournisseur, Ct.NomCategorie,
    Prod.UniteContionnement, Prod.PrixUnitaire, Prod.QuantiteEnStock,
    Prod.QuantiteEnCommande, Prod.NiveauReappro
FROM Ventes.dbo.Produit AS Prod
    JOIN Ventes.dbo.Fournisseur AS Fo ON Prod.FournisseurId = Fo.FournisseurId
    JOIN Ventes.dbo.Categorie AS Ct ON Prod.CategorieId = Ct.CategorieId
WHERE Prod.EnRupture=1;