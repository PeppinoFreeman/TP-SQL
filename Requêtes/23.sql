-- AFFICHE LES SOCIETES AVEC UN CLIMAT SELON LE PAYS
SELECT NomSociete, Pays,
    CASE 
    WHEN Pays = 'Germany' THEN 'tempéré'
    WHEN Pays = 'France' THEN 'moyen tempéré'
    WHEN Pays = 'Mexico' THEN 'chaud'
    WHEN Pays = 'Canada' THEN 'frais'
    ELSE 'ne sait pas'
    END AS Climat
FROM Ventes.dbo.Client;