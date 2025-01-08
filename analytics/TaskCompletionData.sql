SELECT 
    PR."Project Name" AS "Project Name",
    PR."Completed On" AS "Completed On",
    PR."Onboarding Date" AS "Onboarding Date",
    PR."Status" AS "Status",
    PR."Start Date" AS "Start Date",
    PR."End Date" AS "End Date",
    COUNT(T."Task ID") AS "Total Tasks",
    SUM(
        CASE 
            WHEN T."Status" = 'Completed' THEN 1
            ELSE 0
        END
    ) AS "Completed Tasks",
    COUNT(T."Task ID") - SUM(
        CASE 
            WHEN T."Status" = 'Completed' THEN 1
            ELSE 0
        END
    ) AS "Remaining Tasks",
    ROUND(
        SUM(
            CASE 
                WHEN T."Status" = 'Completed' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(T."Task ID"), 2
    ) AS "Percentage Done"
FROM 
    "Projects (Zoho Projects)" AS PR
LEFT JOIN 
    "Tasks (Zoho Projects)" AS T 
ON 
    PR."Project ID" = T."Project ID"
GROUP BY 
    PR."Project Name",
    PR."Completed On",
    PR."Onboarding Date",
    PR."Status",
    PR."Start Date",
    PR."End Date";
