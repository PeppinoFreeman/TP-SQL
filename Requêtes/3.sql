-- AFFICHE LE NOMBRE DE LIGNES PAR TABLE
SELECT COUNT(*) AS Collation
FROM Ventes.dbo.Collation;

SELECT COUNT(*) AS Client
FROM Ventes.dbo.Client;

SELECT COUNT(*) AS Categorie
FROM Ventes.dbo.Categorie;

SELECT COUNT(*) AS Division
FROM Ventes.dbo.Division;

SELECT COUNT(*) AS Fournisseur
FROM Ventes.dbo.Fournisseur;

SELECT COUNT(*) AS Transporteur
FROM Ventes.dbo.Transporteur;

SELECT COUNT(*) AS Service
FROM Ventes.dbo.Service;

SELECT COUNT(*) AS Produit
FROM Ventes.dbo.Produit;

SELECT COUNT(*) AS Employe
FROM Ventes.dbo.Employe;

SELECT COUNT(*) AS HistoriqueSalaires
FROM Ventes.dbo.HistoriqueSalaires;

SELECT COUNT(*) AS Commande
FROM Ventes.dbo.Commande;

SELECT COUNT(*) AS LigneCommandes
FROM Ventes.dbo.LigneCommandes;
