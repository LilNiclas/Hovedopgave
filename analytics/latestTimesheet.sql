SELECT
		 p."Project Name" AS "Projekt",
		 p."Project ID" AS "Projekt ID",
		 p."Status" AS "Status",
		 MAX(ts."Created Time") AS "Seneste Tidstagning"
FROM  "Projects (Zoho Projects)" AS  p
LEFT JOIN "Timesheet (Zoho Projects)" AS  ts ON p."Project ID"  = ts."Project ID"  
GROUP BY p."Project Name",
	 p."Project ID",
	  p."Status" 
