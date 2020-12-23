/* AFFICHE UNE SEULE COLONNE CONTENANT 
LE NOM DE SOCIETE ET DE CONTACT DE LA 
TABLE CLIENT  */
SELECT NomSociete+ ' : ' +ContactNom AS 'Société + Contact'
FROM Ventes.dbo.Client;

/*
    SELECT NomSociete AS 'Société + Contact'
    FROM Ventes.dbo.Client
UNION ALL
    SELECT ContactNom
    FROM Ventes.dbo.Client; 
*/