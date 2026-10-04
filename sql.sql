CREATE DATABASE operations_sla;
USE operations_sla;
SHOW TABLES FROM operations_sla;
SELECT * FROM orders
LIMIT 10;
SELECT
    COUNT(DISTINCT Ticket_ID) AS Total_Tickets
FROM orders;
SELECT
    Category,
    COUNT(DISTINCT Ticket_ID) AS Ticket_Count
FROM orders
GROUP BY Category
ORDER BY Ticket_Count DESC;
SELECT
    SLA_Status,
    COUNT(DISTINCT Ticket_ID) AS Ticket_Count
FROM operations_sla_tickets
GROUP BY SLA_Status;
SELECT
    Category,
    COUNT(DISTINCT Ticket_ID) AS Total_Tickets,
    SUM(
        CASE
            WHEN SLA_Status = 'Breached'
            THEN 1
            ELSE 0
        END
    ) AS Breaches
FROM operations_sla_tickets
GROUP BY Category
ORDER BY Breaches DESC;
SELECT
    AVG(Resolution_Hours) AS Average_Resolution_Hours
FROM operations_sla_tickets
WHERE Resolution_Hours IS NOT NULL;
SELECT
    Region,
    COUNT(DISTINCT Ticket_ID) AS Tickets,
    AVG(Resolution_Hours) AS Avg_Resolution_Hours
FROM operations_sla_tickets
GROUP BY Region
ORDER BY Tickets DESC;