SELECT
		 "Møder"."Titel" AS "Møde Titel",
		 NULL AS "Opkald Emne",
		 NULL AS "Tilbud Emne",
		 NULL AS "Faktura Emne",
		 NULL AS "Faktura Totalt beløb",
		 "Møder"."Vært Name" AS "Vært Name",
		 NULL AS "Ring til ejer Name",
		 NULL AS "Tilbud Ejer Name",
		 NULL AS "Faktura Ejer Name",
		 COALESCE("Møder"."Vært Name", 'No Owner') AS "Owner Name"
FROM  "Møder"
LEFT JOIN "Brugere" AS  "MøderOwner" ON "Møder"."Vært Name"  = "MøderOwner"."Id"  
WHERE	 MONTH("Møder"."Fra")  = MONTH(CURRENT_DATE())
 AND	YEAR("Møder"."Fra")  = YEAR(CURRENT_DATE())
 AND	"Møder"."Relateret til"  IS NOT NULL
UNION ALL
 SELECT
		 NULL AS "Møde Titel",
		 "Opkald"."Emne" AS "Opkald Emne",
		 NULL AS "Tilbud Emne",
		 NULL AS "Faktura Emne",
		 NULL AS "Faktura Totalt beløb",
		 NULL AS "Vært Name",
		 "Opkald"."Ring til ejer Name" AS "Ring til ejer Name",
		 NULL AS "Tilbud Ejer Name",
		 NULL AS "Faktura Ejer Name",
		 COALESCE("Opkald"."Ring til ejer Name", 'No Owner') AS "Owner Name"
FROM  "Opkald"
LEFT JOIN "Brugere" AS  "OpkaldOwner" ON "Opkald"."Ring til ejer"  = "OpkaldOwner"."Id"  
WHERE	 MONTH("Opkald"."Opkalds starttid")  = MONTH(CURRENT_DATE())
 AND	YEAR("Opkald"."Opkalds starttid")  = YEAR(CURRENT_DATE())
UNION ALL
 SELECT
		 NULL AS "Møde Titel",
		 NULL AS "Opkald Emne",
		 "Tilbud"."Emne" AS "Tilbud Emne",
		 NULL AS "Faktura Emne",
		 NULL AS "Faktura Totalt beløb",
		 NULL AS "Vært Name",
		 NULL AS "Ring til ejer Name",
		 "Tilbud"."Tilbud Ejer Name" AS "Tilbud Ejer Name",
		 NULL AS "Faktura Ejer Name",
		 COALESCE("Tilbud"."Tilbud Ejer Name", 'No Owner') AS "Owner Name"
FROM  "Tilbud"
LEFT JOIN "Brugere" AS  "TilbudOwner" ON "Tilbud"."Tilbud Ejer"  = "TilbudOwner"."Id"  
WHERE	 MONTH("Tilbud"."Oprettelsestid")  = MONTH(CURRENT_DATE())
 AND	YEAR("Tilbud"."Oprettelsestid")  = YEAR(CURRENT_DATE())
 AND	("Tilbud"."Tilbud Fase"  = 'Tilbud Sendt'
 OR	"Tilbud"."Tilbud Fase"  = 'Tilbud Accepteret')
UNION ALL
 SELECT
		 NULL AS "Møde Titel",
		 NULL AS "Opkald Emne",
		 NULL AS "Tilbud Emne",
		 "Faktura"."Emne" AS "Faktura Emne",
		 "Faktura"."Totalt beløb" AS "Faktura Totalt beløb",
		 NULL AS "Vært Name",
		 NULL AS "Ring til ejer Name",
		 NULL AS "Tilbud Ejer Name",
		 "Faktura"."Faktura Ejer Name" AS "Faktura Ejer Name",
		 COALESCE("Faktura"."Faktura Ejer Name", 'No Owner') AS "Owner Name"
FROM  "Faktura"
LEFT JOIN "Brugere" AS  "FakturaOwner" ON "Faktura"."Faktura Ejer"  = "FakturaOwner"."Id"  
WHERE	 MONTH("Faktura"."Oprettelsestid")  = MONTH(CURRENT_DATE())
 AND	YEAR("Faktura"."Oprettelsestid")  = YEAR(CURRENT_DATE())
 AND	"Faktura"."Status"  = 'Faktura Bogført'
 
 
 
