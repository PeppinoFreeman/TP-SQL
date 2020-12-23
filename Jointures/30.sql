-- AFFICHE LES FOURNISSEURS QUI N'ONT PAS DE PRODUITS
SELECT Fo.*
FROM Ventes.dbo.Fournisseur AS Fo
    LEFT JOIN Ventes.dbo.Produit AS Prod ON Fo.FournisseurId = Prod.FournisseurId
WHERE Prod.FournisseurId IS NULL;