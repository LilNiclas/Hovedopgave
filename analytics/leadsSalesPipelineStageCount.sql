SELECT
		 Leads."Sælger Pipeline Stage" AS Stage,
		 COUNT(Leads."Id") AS Lead_Count
FROM  Leads 
GROUP BY  Leads."Sælger Pipeline Stage" 
