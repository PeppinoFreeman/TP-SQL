-- AJOUTE UNE COLONNE A LA TABLE ENTITE
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