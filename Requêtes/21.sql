-- AFFICHE LE CHIFFRE D'AFFAIRE DE CHAQUE TRANSPORTEUR
SELECT TransporteurId, SUM(Transport) as 'CA Transporteur'
FROM Ventes.dbo.Commande
GROUP BY TransporteurId
ORDER BY TransporteurId;
