-- CREE UNE VUE CLIENT_ANGLAIS
CREATE OR ALTER VIEW CLIENT_ANGLAIS
AS 
SELECT NomSociete, ContactTitre, ContactNom, Adresse, 
    Ville, Region, CodePostal, Pays, Telephone, Fax
FROM Ventes.dbo.Client;