/* Display all data from the 'video_game_sales' table.*/
SELECT * FROM `video game sales`;

/* How many rows (records) are there in the 'video_game_sales' table? */
SELECT COUNT(*) AS Total_Record FROM `video game sales`;

/* Show the top 10 games based on global sales (Global_Sales) */
SELECT * FROM `video game sales` ORDER BY Global_Sales DESC LIMIT 10;

/* Display the total global sales (Global_Sales) of all games. */ 
SELECT SUM(Global_Sales) AS Total_Global_Sales FROM `video game sales`;

/*  List the unique years available in this dataset */
SELECT DISTINCT Year FROM `video game sales`;

/* Show the average global sales (Global_Sales) based on platform (Platform) */
SELECT Platform, AVG(Global_Sales) AS Average_Global_Sales
FROM `video game sales`
GROUP BY Platform;

/* How many games have global sales (Global_Sales) exceeding 1 million copies? */
SELECT COUNT(*) AS Number_of_Games
FROM `video game sales`
WHERE Global_Sales > 1;

/* Display the top 5 publishers based on total global sales (Global_Sales) of their games. */
SELECT Publisher, SUM(Global_Sales) AS Total_Global_Sales
FROM `video game sales`
GROUP BY Publisher
ORDER BY Total_Global_Sales DESC
LIMIT 5;

/* How many games have global sales (Global_Sales) above the overall average global sales? */
SELECT COUNT(*) AS Number_of_Games
FROM `video game sales`
WHERE Global_Sales > (SELECT AVG(Global_Sales) FROM Video_Game_Sales);

/* From the available platforms in this dataset, which platform has the highest total global sales (Global_Sales)? */
SELECT Platform, SUM(Global_Sales) AS Total_Global_Sales
FROM `video game sales`
GROUP BY Platform
ORDER BY Total_Global_Sales DESC
LIMIT 1;

/* Show the top 5 publishers with the highest average global sales (Global_Sales) from their games. */
SELECT Publisher, AVG(Global_Sales) AS Average_Global_Sales
FROM `video game sales`
GROUP BY Publisher
ORDER BY Average_Global_Sales DESC
LIMIT 5;


