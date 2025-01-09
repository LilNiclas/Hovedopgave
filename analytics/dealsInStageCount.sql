SELECT
		 Tilbud."Tilbud Fase" AS Stage,
		 COUNT(Tilbud."Id") AS Tilbud_Count
FROM  Tilbud 
GROUP BY  Tilbud."Tilbud Fase" 
