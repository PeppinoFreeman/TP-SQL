/*---------------
    REQUETES
*/---------------
--1-- AFFICHE LA LISTE DES TABLES DE LA DB
SELECT TABLE_NAME AS 'Tables' 
FROM INFORMATION_SCHEMA.TABLES;

--2-- AFFICHE LE CONTENU DE CHAQUE TABLE
SELECT *
FROM Ventes.dbo.Collation;
SELECT *
FROM Ventes.dbo.Client;
SELECT *
FROM Ventes.dbo.Categorie;
SELECT *
FROM Ventes.dbo.Division;
SELECT *
FROM Ventes.dbo.Fournisseur;
SELECT *
FROM Ventes.dbo.Transporteur;
SELECT *
FROM Ventes.dbo.Service;
SELECT *
FROM Ventes.dbo.Produit;
SELECT *
FROM Ventes.dbo.Employe;
SELECT *
FROM Ventes.dbo.HistoriqueSalaires;
SELECT *
FROM Ventes.dbo.Commande;
SELECT *
FROM Ventes.dbo.LigneCommandes;

--3-- AFFICHE LE NOMBRE DE LIGNES PAR TABLE
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

--4-- AFFICHE LE NOM DE SOCIETE DES CLIENTS
SELECT NomSociete
FROM Ventes.dbo.Client;

--5-- AFFICHE LA LISTE DES PRODUIS PAR 
-- ORDRE ALPHABETIQUE CROISSANT
SELECT NomProduit AS 'Nom' 
FROM Ventes.dbo.Produit
ORDER BY Nom; 

--6-- AFFICHE LE NOM DE SOCIETE, CONTACTS ET ADRESSES 
-- DE LA TABLE CLIENT
SELECT NomSociete, ContactNom, Adresse
FROM Ventes.dbo.Client;

--7-- AFFICHE LA SOCIETE DU CONTACT 'Aria Cruz'
SELECT NomSociete
FROM Ventes.dbo.Client
WHERE ContactNom = 'Aria Cruz';
-- Retourne la société : ' Familia Arquibaldo '

--8-- AFFICHE LES INFORMATIONS DU CONTACT 'Ann Devon'
SELECT NomSociete, Telephone, Fax
FROM Ventes.dbo.Client
WHERE ContactNom = 'Ann Devon';

--9-- AFFICHE UNE SEULE COLONNE CONTENANT 
-- LE NOM DE SOCIETE ET DE CONTACT DE LA 
-- TABLE CLIENT 
SELECT NomSociete+ ' : ' +ContactNom AS 'Société + Contact'
FROM Ventes.dbo.Client;

/*
    SELECT NomSociete AS 'Société + Contact'
    FROM Ventes.dbo.Client
UNION ALL
    SELECT ContactNom
    FROM Ventes.dbo.Client; 
*/

--10-- AFFICHE LES CLIENTS ANGLAIS (originaire d'UK)
SELECT * 
FROM Ventes.dbo.Client
WHERE Pays='UK'; 

--11-- AFFICHE LE NOM DE SOCIETE, DU CLIENT 
-- ET LE TITRE DU CONTACT DANS UN SEUL CHAMPS 
SELECT NomSociete+' : '+
    ContactNom+' : ' +
    ContactTitre 
  AS 'Société : Contact : Titre'
FROM Ventes.dbo.Client;

--12-- AFFICHE LES CLIENTS ANGLAIS HABITANT A LONDRES
SELECT *
FROM Ventes.dbo.Client
WHERE Pays='UK'
    AND Ville='LONDON'; 

--13-- AFFICHE LES CLIENTS ANGLAIS OU FRANCAIS
SELECT *
FROM Ventes.dbo.Client
WHERE Pays='UK'
    OR Pays='France'; 

--14-- AFFICHE LES CLIENTS QUI NE SONT PAS ANGLAIS
SELECT *
FROM Ventes.dbo.Client
WHERE Pays <> 'UK';

--15-- AFFICHE LES SOCIETES ET ADRESSES PAR ORDRE DE PAYS
SELECT NomSociete, Adresse
FROM Ventes.dbo.Client
ORDER BY Pays;

--16-- AFFICHE LES CLIENTS DONT ON NE CONNAIT PAS LA REGION
SELECT *
FROM Ventes.dbo.Client
WHERE Region IS NULL;

--17-- AFFICHE lES CLIENTS QUI N'ONT PAS DE FAX
-- AVEC LE CHAMPS INDEFINI
SELECT ClientId,
    NomSociete,
    ContactNom ,
    ContactTitre,
    Adresse,
    Ville,
    Region,
    CodePostal,
    Pays,
    Telephone,
    ISNULL(Fax,'indéfini') AS Fax
FROM Ventes.dbo.Client
WHERE Fax is NULL;

--18-- LISTE LES COMMANDES EFFECTUEES EN 1996
SELECT *
FROM Ventes.dbo.Commande
WHERE DateCommande BETWEEN'19960101' AND '19961231 23:59:59';
-- Or with this clause 
--WHERE YEAR(DateCommande)='1996';

--19-- LISTE LES COMMANDES EFFECTUEES EN JUILLET 1996
SELECT *
FROM Ventes.dbo.Commande
WHERE DateCommande BETWEEN'19960701' AND '19960731 23:59:59';
-- Or with this clause 
--WHERE YEAR(DateCommande)='1996' AND MONTH(DateCommande)='7';

--20-- LISTE LES EMPLOYES DONT LE PRENOM SE TERMINE PAR *NE
SELECT *
FROM Ventes.dbo.Employe
WHERE Prenom LIKE '%ne'

--21-- AFFICHE LE CHIFFRE D'AFFAIRE DE CHAQUE TRANSPORTEUR
SELECT TransporteurId, SUM(Transport) as 'CA Transporteur'
FROM Ventes.dbo.Commande
GROUP BY TransporteurId
ORDER BY TransporteurId;

--22-- AFFICHE LES CLIENTS ID AVEC UN CHIFFRE D'AFFAIRE CUMULE > 1000
SELECT ClientId, SUM(Transport) as 'CA Transport'
FROM Ventes.dbo.Commande
GROUP BY ClientId
    HAVING SUM(Transport)>1000
ORDER BY 'CA Transport' DESC

--23-- AFFICHE LES SOCIETES AVEC UN CLIMAT SELON LE PAYS
SELECT NomSociete, Pays,
    CASE 
    WHEN Pays = 'Germany' THEN 'tempéré'
    WHEN Pays = 'France' THEN 'moyen tempéré'
    WHEN Pays = 'Mexico' THEN 'chaud'
    WHEN Pays = 'Canada' THEN 'frais'
    ELSE 'ne sait pas'
    END AS Climat
FROM Ventes.dbo.Client;

--24-- AFFICHE L'ID DE CHAQUE EMPLPYE AVEC SON SALAIRE MAX
SELECT EmployeId, MAX(Salaire) as 'Salaire maximum'
FROM Ventes.dbo.HistoriqueSalaires
GROUP BY EmployeId;

--25-- AFFICHE L'ID DE CHAQUE EMPLOYE AVEC SON SALAIRE MIN
-- ORDONNE PAR ORDRE CROISSANT
SELECT EmployeId, MIN(Salaire) as 'Salaire minimum'
FROM Ventes.dbo.HistoriqueSalaires
GROUP BY EmployeId
ORDER BY 'Salaire minimum';

--26-- AFFICHE L'ID DE CHAQUE EMPLOYE AVEC SON SALAIRE MOYEN
SELECT EmployeId, AVG(Salaire) as 'Salaire moyen'
FROM Ventes.dbo.HistoriqueSalaires
GROUP BY EmployeId;

--27-- AFFICHE L'ID DE CHAQUE EMPLOYE AVEC SON SALAIRE CUMULE
SELECT EmployeId, SUM(Salaire) as 'Salaire cumulé'
FROM Ventes.dbo.HistoriqueSalaires
GROUP BY EmployeId
ORDER BY 'Salaire cumulé';

--28 AFFICHE LE NOMBRE DE LIGNE DE LA TABLE COMMANDE
SELECT COUNT(*) AS 'Nombre de lignes'
FROM Ventes.dbo.Commande;

--29-- AFFICHE LE NOMBRE DE CLIENT PAR PAYS 
SELECT Pays, COUNT(*) AS 'Nombre de clients'
FROM Ventes.dbo.Client
GROUP BY Pays;

--30-- AFFICHE LES PAYS AVEC PLUS DE 3 CLIENTS
SELECT Pays, COUNT(*) AS 'Nombre de clients'
FROM Ventes.dbo.Client
GROUP BY Pays
HAVING COUNT(*) > 3;

/* ----------------
    JOINTURES
*/------------------
--19-- AFFICHE LES COMMANDES FAIT PAR DES CLIENTS
SELECT *
FROM Ventes.dbo.Client as Cl
    JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId;

--20-- AFFICHE LES COMMANDES DE L'EMPLOYE MARIANNE 
-- (JUSTE LA TABLE COMMANDE)
SELECT Co.*
FROM Ventes.dbo.Employe as Em
    JOIN Ventes.dbo.Commande as Co on Em.EmployeId = Co.EmployeId
WHERE Em.Nom ='Marianne' OR Em.Prenom='Marianne';

--21-- AFFICHE LES CLIENTS SANS COMMANDES 
-- (JUSTE LA TABLE CLIENT)
SELECT Cl.*
FROM Ventes.dbo.Client as Cl
    LEFT JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId
WHERE Co.ClientId IS NULL;

--22-- AFFICHE TOUS LES CLIENTS Y COMPRIS CEUX SANS COMMANDE
SELECT *
FROM Ventes.dbo.Client as Cl
    LEFT JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId;

--23-- AFFICHE LES COMMANDES PASSEE PAR LE CLIENT AVEC L'ID OTTIK 
-- (JUSTE LA TABLE DES COMMANDES)
SELECT Co.*
FROM Ventes.dbo.Client as Cl
    JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId
    WHERE Co.ClientId = 'OTTIK';

--24-- AFFICHE LES COMMANDES PASSEE PAR LE CLIENT AVEC L'ID OTTIK 
-- OU DANS LA VILLE DE PARIS (JUSTE LA TABLE DES COMMANDES ET
-- LA VILLE DE LA TABLE CLIENT)
SELECT Co.*, Cl.Ville
FROM Ventes.dbo.Client as Cl
    JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId
    WHERE Co.ClientId = 'OTTIK' OR Cl.Ville = 'Paris';

--25-- AFFICHE LES EMPLOYES DE LA DIVISION EUROPE
SELECT *
FROM Ventes.dbo.Employe as Em
    JOIN Ventes.dbo.Division as Div on Em.DivisionId = Div.DivisionId
WHERE Div.NomDivision = 'Europe'; 

--26-- AFFICHE LE NOMBRE D'EMPLOYES PAR DIVISION
SELECT Div.NomDivision,Count(*) AS 'Nombre d''employés par division'
FROM Ventes.dbo.Employe as Em
    JOIN Ventes.dbo.Division as Div on Em.DivisionId = Div.DivisionId
GROUP BY Div.NomDivision;

--27-- AFFICHE LE CA DE CHAQUE CATEGORIE
SELECT ct.NomCategorie, SUM(PrixUnitaire) AS 'Chiffre d''Affaires'
FROM Ventes.dbo.Categorie AS ct
    JOIN Ventes.dbo.Produit AS prod ON ct.CategorieId = prod.CategorieId
GROUP BY ct.NomCategorie;

--28-- AFFICHE LA LISTE DES VILLES DES CLIENTS AVEC AU MOINS UNE COMMANDE
-- DANS UN ORDRE ALPHABETIQUE
SELECT Ville
FROM Ventes.dbo.Client as Cl
    JOIN Ventes.dbo.Commande as Co on Cl.ClientId = Co.ClientId
GROUP By Ville
ORDER BY Ville;

--29-- AFFICHE LES IDs DES CLIENTS AYANT ACHETE UN PRODUIT 
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

--30-- AFFICHE LES FOURNISSEURS QUI N'ONT PAS DE PRODUITS
SELECT Fo.*
FROM Ventes.dbo.Fournisseur AS Fo
    LEFT JOIN Ventes.dbo.Produit AS Prod ON Fo.FournisseurId = Prod.FournisseurId
WHERE Prod.FournisseurId IS NULL;

/*------------------
    LMD
*/------------------
--31-- AJOUTE UNE NOUVELLE LIGNE DANS LA TABLE CATEGORIE 
-- (on utilise MERGE pour que l'insertion ne se fait qu'une seule fois)
MERGE INTO Ventes.dbo.Categorie AS Target
USING (
    SELECT 'Champignon' AS NomCategorie,
    'Champignons français' AS [Description] 
) source
ON Target.NomCategorie = source.NomCategorie
WHEN NOT MATCHED THEN 
    INSERT (NomCategorie,[Description])
        VALUES(source.NomCategorie,source.Description);

SELECT *
FROM Ventes.dbo.Categorie;

--32-- AUGMENTE LE SALAIRE DE L'EMPLOYE 'LEVERLING' DE 20%
-- ET LUI ATTRIBUE UNE PRIME DE 2000
UPDATE Ventes.dbo.Employe
    SET Prime = 2000, SalaireActuel = SalaireActuel*1.2
WHERE Employe.Nom = 'Leverling';

SELECT *
FROM Ventes.dbo.Employe
WHERE Employe.Nom = 'Leverling';

--33-- SUPPRIME LA CATEGORIE 'CHAMPIGNON' DE LA TABLE CATEGORIE
DELETE FROM Ventes.dbo.Categorie
WHERE NomCategorie = 'Champignon';

SELECT * 
From Ventes.dbo.Categorie;

--34-- AJOUTE DES ENTREES DANS LA TABLE TRANSPORTEURS
-- (on utilise MERGE pour que l'insertion ne se fait qu'une seule fois) 
MERGE INTO Ventes.dbo.Transporteur AS Target
USING (
    SELECT '11'AS TransporteurId,
    'Livraison rapide' AS NomSociete, 
    '(0033)123456789' AS Telephone 
) source
ON Target.TransporteurId = source.TransporteurId
WHEN NOT MATCHED THEN 
    INSERT (NomSociete,Telephone)
        VALUES(source.NomSociete,source.Telephone);

MERGE INTO Ventes.dbo.Transporteur AS Target
USING (
    SELECT '12'AS TransporteurId,
    'Leader Transporter''' AS NomSociete, 
    '(0141)9876543' AS Telephone 
) source
ON Target.TransporteurId = source.TransporteurId
WHEN NOT MATCHED THEN 
    INSERT (NomSociete,Telephone)
        VALUES(source.NomSociete,source.Telephone);

MERGE INTO Ventes.dbo.Transporteur AS Target
USING (
    SELECT 'Safe Transport' AS NomSociete
) source
ON Target.NomSociete = source.NomSociete
WHEN NOT MATCHED THEN 
    INSERT (NomSociete)
        VALUES(source.NomSociete);

SELECT *
FROM Ventes.dbo.Transporteur;

--35-- SUPPRIME LES TRANSPORTEURS CREES DANS 
-- L'OPERATION PRECEDENTE
DELETE FROM Ventes.dbo.Transporteur
WHERE NomSociete IN ('Livraison rapide','Leader Transporter''','Safe Transport');

SELECT * 
From Ventes.dbo.Transporteur;

--36-- ATTRIBUE UNE PRIME DE 350 AUX SALARIES AVEC UN 
-- CA > 50 000 EN 1999
UPDATE Ventes.dbo.Employe
    SET Prime = 350
FROM (
SELECT Em.EmployeId, SUM(Lc.Quantite * Lc.PrixUnitaire) AS 'Chiffre d''affaire'
FROM Employe as Em
	JOIN Commande as Co On Em.EmployeId = Co.EmployeId
	JOIN LigneCommandes as Lc On Co.CommandeId = Lc.CommandeId 
WHERE Co.DateCommande BETWEEN'19990101' AND '19991231 23:59:59'
GROUP BY Em.EmployeId
HAVING SUM(Lc.Quantite * Lc.PrixUnitaire)>50000
) AS Ep
WHERE Employe.EmployeId = Ep.EmployeId; 


SELECT EmployeId,Prime
FROM Employe;
/*------------------
    LDD
*/------------------
--37- CREE UNE TABLE ENTITE AVEC DEUX CHAMPS
-- (LA CREATION NE SE FAIT QU'UNE SEULE FOIS)
IF NOT EXISTS(SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[Entite]') AND type in (N'U'))

CREATE TABLE [Ventes].[dbo].[Entite]
(
    IDENTIFIANT INT NOT NULL PRIMARY KEY,
    LIBELLE VARCHAR(100) not NULL
)

SELECT *
FROM Ventes.dbo.Entite;

--38-- AJOUTE UNE COLONNE A LA TABLE ENTITE
-- (L'AJOUT NE SE FAIT QU'UNE SEULE FOIS)
IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dbo].[Entite]') 
         AND name = 'DATECREATION'
)

ALTER TABLE Ventes.dbo.Entite
ADD DATECREATION Date;

SELECT *
FROM Ventes.dbo.Entite;

--39-- AJOUTE UNE CONTRAINTE PAR DEFAUT SUR LA COLONNE 'DATECREATION'
-- DANS LA TABLE ENTITE
ALTER TABLE Ventes.dbo.Entite
ADD CONSTRAINT cs default CURRENT_TIMESTAMP for [DATECREATION];

SELECT *
FROM Ventes.dbo.Entite;

--40-- CREE UNE TABLE LOCATAIRES
-- (LA CREATION NE SE FAIT QU'UNE SEULE FOIS)
IF NOT EXISTS(SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[Locataires]') AND type in (N'U'))

CREATE TABLE [Ventes].[dbo].[Locataires]
(
    CODE_LOCATAIRE INT PRIMARY KEY IDENTITY(1,1),
    NOM NVARCHAR(30) not NULL,
    PRENOM NVARCHAR(30) not NULL,
    AGE INT CHECK(AGE>=18 AND AGE<=70),
    MAIL VARCHAR(100) CHECK(MAIL LIKE '%@%'),
    DATE_LOCATION DATE DEFAULT CURRENT_TIMESTAMP,
    ADRESSE VARCHAR(100),
    DEPARTEMENT INT
)

SELECT *
FROM Ventes.dbo.Locataires;

--41-- AJOUTE UNE CONTRAINTE DE VERIFICATION DE L'AGE
-- DANS LA TABLE LOCATAIRES
ALTER TABLE Ventes.dbo.Locataires
ADD CONSTRAINT Dpt_nb CHECK([DEPARTEMENT]>=1 AND [DEPARTEMENT]<=95);

SELECT *
FROM Ventes.dbo.Locataires;

--42-- AJOUTE UNE CONTRAINTE D'UNICITE DU MAIL
-- DANS LA TABLE LOCATAIRES
ALTER TABLE Ventes.dbo.Locataires
ADD CONSTRAINT mail_unique UNIQUE([MAIL]);

SELECT *
FROM Ventes.dbo.Locataires;

--43-- AJOUTE UNE COLONNE 'NUMERO_TELEPHONE' A LA TABLE LOCATAIRES
-- (L'AJOUT NE SE FAIT QU'UNE SEULE FOIS)
IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dbo].[Locataires]') 
         AND name = 'NUMERO_TELEPHONE'
)

ALTER TABLE Ventes.dbo.Locataires
ADD NUMERO_TELEPHONE VARCHAR(40);

SELECT *
FROM Ventes.dbo.Locataires;

--44-- AJOUTE UNE CONTRAINTE D'UNICITE DU NUM_TEL
-- DANS LA TABLE LOCATAIRES
ALTER TABLE Ventes.dbo.Locataires
ADD CONSTRAINT telephone_unique UNIQUE([NUMERO_TELEPHONE]);

SELECT *
FROM Ventes.dbo.Locataires;

--45-- CREE UNE TABLE MAISON
-- (LA CREATION NE SE FAIT QU'UNE SEULE FOIS)
IF NOT EXISTS(SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[Maison]') AND type in (N'U'))

CREATE TABLE [Ventes].[dbo].[Maison]
(
    NUM_MAISON INT NOT NULL,
    CODE_LOCATAIRE INT NOT NULL,
    NBR_CHAMBRE INT NOT NULL,
    SURFACE INT NOT NULL,
)

SELECT *
FROM Ventes.dbo.Maison;

--46-- AJOUTE UNE CONTRAINTE DE CLE PRIMAIRE SUR LE CHAMP 
--'NUM_MAISON' DANS LA TABLE MAISON
ALTER TABLE Ventes.dbo.MAISON
ADD CONSTRAINT PK_Nb_House PRIMARY KEY([NUM_MAISON]);

SELECT *
FROM Ventes.dbo.MAISON;

--47-- AJOUTE UNE CONTRAINTE DE CLE ETRANGERE SUR LE CHAMP 
--'CODE_LOCATAIRE' DANS LA TABLE MAISON
ALTER TABLE Ventes.dbo.MAISON
ADD CONSTRAINT FK_CODE 
    FOREIGN KEY([CODE_LOCATAIRE])
    REFERENCES Ventes.dbo.Locataires([CODE_LOCATAIRE]);

SELECT *
FROM Ventes.dbo.MAISON;

--48-- AJOUTE UNE CONTRAINTE CHECK SUR LE CHAMP 'SURFACE' 
-- DANS LA TABLE MAISON
ALTER TABLE Ventes.dbo.MAISON
ADD CONSTRAINT constraint_sfc CHECK([SURFACE]>=30 AND [SURFACE]<=150);

SELECT *
FROM Ventes.dbo.MAISON;

/*------------------
    VUES
*/------------------
--49-- CREE UNE VUE CLIENT_ANGLAIS
/*
CREATE OR ALTER VIEW CLIENT_ANGLAIS
AS 
SELECT NomSociete, ContactTitre, ContactNom, Adresse, 
    Ville, Region, CodePostal, Pays, Telephone, Fax
FROM Ventes.dbo.Client;
*/

--50-- CREE UNE VUE TYPOLOGIE_CLIENT AFFICHANT L'ID,
-- LA SOCIETE ET LE NOMBRE DE COMMANDE DE CHAQUE CLIENT
/*
CREATE OR ALTER VIEW TYPOLOGIE_CLIENT
AS 
SELECT Cl.ClientId,Cl.NomSociete, COUNT(Co.ClientId) AS 'Nombre de commandes', 
CASE
    WHEN COUNT(Co.ClientId) <= 10 THEN 'CLIENT OCCASIONNEL'
    WHEN COUNT(Co.ClientId) BETWEEN 11 AND 20 THEN 'CLIENT FREQUENT'
    WHEN COUNT(Co.ClientId) BETWEEN 21 AND 30 THEN 'CLIENT FIDELE'
    ELSE 'SUPER CLIENT'
END AS Typologie
FROM Ventes.dbo.Client AS Cl
    LEFT JOIN Ventes.dbo.Commande AS Co ON Cl.ClientId = Co.ClientId
GROUP BY Cl.ClientId,Cl.NomSociete;
*/

--51-- CREE UNE VUE CATALOGUE_PRODUIT AFFICHANT DES CHAMPS
-- SPECIFIQUES D'UN PRODUIT
/*
CREATE OR ALTER VIEW CATALOGUE_PRODUIT
AS 
SELECT Prod.NomProduit, Prod.UniteContionnement, Prod.PrixUnitaire,
    Ct.NomCategorie, Fo.ContactNom AS 'NomFournisseur'
FROM Ventes.dbo.Produit AS Prod
    JOIN Ventes.dbo.Fournisseur AS Fo ON Prod.FournisseurId = Fo.FournisseurId
    JOIN Ventes.dbo.Categorie AS Ct ON Prod.CategorieId = Ct.CategorieId;
*/

--52-- CREE UNE VUE PRODUIT_EN_RUPTURE 
/*
CREATE OR ALTER VIEW PRODUIT_EN_RUPTURE
AS 
SELECT Prod.ProduitId, Prod.NomProduit, Fo.ContactNom AS NomFournisseur, Ct.NomCategorie,
    Prod.UniteContionnement, Prod.PrixUnitaire, Prod.QuantiteEnStock,
    Prod.QuantiteEnCommande, Prod.NiveauReappro
FROM Ventes.dbo.Produit AS Prod
    JOIN Ventes.dbo.Fournisseur AS Fo ON Prod.FournisseurId = Fo.FournisseurId
    JOIN Ventes.dbo.Categorie AS Ct ON Prod.CategorieId = Ct.CategorieId
WHERE Prod.EnRupture=1;
*/

--53-- CREE UNE VUE DU CHIFFRE D'AFFAIRE ANNUEL DE CHAQUE EMPLOYE  
/*
CREATE OR ALTER VIEW CA_ANNUEL_EMPLOYE
AS 
SELECT Em.EmployeId,YEAR(Co.DateCommande) AS 'Année' , SUM(Lc.Quantite * Lc.PrixUnitaire) AS 'Chiffre d''affaire'
FROM Employe as Em
	JOIN Commande as Co On Em.EmployeId = Co.EmployeId
	JOIN LigneCommandes as Lc On Co.CommandeId = Lc.CommandeId 
GROUP BY YEAR(Co.DateCommande), Em.EmployeId;
*/