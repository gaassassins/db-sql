USE[Masha]
GO

SELECT *
  FROM dbo.cvety AS c INNER JOIN dbo.cvet AS r
  ON c.ID_cvet = r.ID
  ORDER BY c.ID
 

GO
SELECT *
  FROM dbo.cvety AS c LEFT JOIN dbo.cvet AS r
  ON c.ID_cvet = r.ID
  ORDER BY c.ID
  
  GO
SELECT *
  FROM dbo.cvety AS c RIGHT JOIN dbo.cvet AS r
  ON c.ID_cvet = r.ID
  ORDER BY c.ID
  
  GO
SELECT *
  FROM dbo.cvety AS c FULL OUTER JOIN dbo.cvet AS r
  ON c.ID_cvet = r.ID
  ORDER BY c.ID




  
GO
SELECT DISTINCT *
FROM dbo.cvety AS r1
    INNER JOIN dbo.cvety AS r2
    ON r1.ID_cvet = r2.ID_cvet
        AND r1.price <> r2.price
ORDER BY r1.id


GO
SELECT *
  FROM dbo.cvet WHERE name LIKE '%lo%'
  ORDER BY name 



GO
SELECT *
FROM cvety
WHERE id_cvet = ANY
   (SELECT id
	  FROM cvet WHERE id > 0)
ORDER BY id



    
GO
SELECT *
FROM cvety
WHERE id_cvet IN
   (SELECT id
	  FROM cvet WHERE id < 2)
ORDER BY id  


GO
SELECT *
FROM cvety
WHERE id_cvet > ALL
   (SELECT id
	  FROM cvet WHERE id < 1)
ORDER BY id  


GO
SELECT id, id_cvet =
      CASE id_cvet
         WHEN 1 THEN 'ALO'
         WHEN 2 THEN 'OLA'
         ELSE 'ALO-OLA'
      END
FROM cvety
ORDER BY id 

 
GO
SELECT id, id*(id+ISNULL(id_cvet,0))
  FROM cvety



GO
SELECT * 
  FROM cvety 
  ORDER BY CAST(image as char)



GO
SELECT IIF(id_cvet IS NULL, 'Не заполнен цвет!', 'Цвет существует') id_cvet 
  FROM cvety


GO
SELECT UPPER(image)
  FROM cvety



GO
SELECT LOWER(image)
  FROM cvety


GO
SELECT id, name, STUFF(name, 1, 1, '000') AS ffghg
  FROM cvet


GO
SELECT GETDATE()

GO
SELECT SYSDATETIMEOFFSET() 


GO
SELECT id_cvet, COUNT(*) 
  FROM cvety 
  GROUP BY id_cvet


GO
SELECT id_cvet, COUNT(*) 
  FROM cvety 
  GROUP BY id_cvet
  HAVING id_cvet > 0