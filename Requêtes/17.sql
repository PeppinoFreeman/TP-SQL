-- AFFICHE lES CLIENTS QUI N'ONT PAS DE FAX
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
