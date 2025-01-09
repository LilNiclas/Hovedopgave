SELECT 
		 ideas."Bug ID" AS "Idea ID",
		 ideas."Created Date" AS "Idea Created Date",
		 ideas."Type" AS "Type",
		 ideas."Estimeret tid" AS "Estimated Time",
		 ideas."Estimeret tid (timer)" AS "Estimated Time (hours)",
		 ideas."Bug Title" AS "Idea Name",
		 ideas."Reporter ID" AS "Reporter ID",
		 project_users."User Email" AS "Reporter Email",
		 users."User Name" AS "Reporter Name",
		 ideas."Project ID" AS "Project ID",
		 projects."Project Name" AS "Project Name",
		 projects."Status" AS "Project Status"
FROM  "Ideas (Zoho Projects)" AS  ideas
JOIN "Project Users (Zoho Projects)" AS  project_users ON ideas."Reporter ID"  = project_users."User ID" 
JOIN "Users (Zoho Projects)" AS  users ON project_users."User Email"  = users."User Email" 
JOIN "Projects (Zoho Projects)" AS  projects ON ideas."Project ID"  = projects."Project ID"  
