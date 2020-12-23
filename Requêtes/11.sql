/* AFFICHE LE NOM DE SOCIETE, DU CLIENT 
ET LE TITRE DU CONTACT DANS UN SEUL CHAMPS */
SELECT NomSociete+' : '+
    ContactNom+' : ' +
    ContactTitre 
  AS 'Société : Contact : Titre'
FROM Ventes.dbo.Client;
