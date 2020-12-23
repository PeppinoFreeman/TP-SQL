-- AFFICHE LES IDs DES CLIENTS AYANT ACHETE UN PRODUIT 
-- DANS LA CATEGORIE CEREALES ET LAITAGE
-- DANS UN ORDRE ALPHABETIQUE
SELECT Cl.ClientId AS ID
FROM Ventes.dbo.Client as Cl
    JOIN Ventes.dbo.Commande as Co ON Cl.ClientId = Co.ClientId
    JOIN Ventes.dbo.LigneCommandes as Lc ON Co.CommandeId = Lc.CommandeId
    JOIN Ventes.dbo.Produit as Prod ON Lc.ProduitId =Prod.ProduitId
    JOIN Ventes.dbo.Categorie as Ct ON Prod.CategorieId = Ct.CategorieId
WHERE NomCategorie = 'Laitages' OR NomCategorie = 'Céréales'
GROUP BY Cl.ClientId
ORDER BY ID;
