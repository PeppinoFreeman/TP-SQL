-- CREE UNE VUE CATALOGUE_PRODUIT AFFICHANT DES CHAMPS
-- SPECIFIQUES D'UN PRODUIT
CREATE OR ALTER VIEW CATALOGUE_PRODUIT
AS 
SELECT Prod.NomProduit, Prod.UniteContionnement, Prod.PrixUnitaire,
    Ct.NomCategorie, Fo.ContactNom AS 'NomFournisseur'
FROM Ventes.dbo.Produit AS Prod
    JOIN Ventes.dbo.Fournisseur AS Fo ON Prod.FournisseurId = Fo.FournisseurId
    JOIN Ventes.dbo.Categorie AS Ct ON Prod.CategorieId = Ct.CategorieId;
