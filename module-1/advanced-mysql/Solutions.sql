-------------------------------------------------------- [mysql-select] --------------------------------------------------------
/*SELECT au.[au_id] as [AUTHOR ID], au.[au_lname] as [LAST NAME],au.[au_fname] as [FIRST NAME], t2.[title] as [TITLE], pu.[pub_name] as [PUBLISHER]
FROM [dbo].[authors] as au
INNER JOIN [dbo].[titleauthor] as t1 ON au.[au_id] = t1.[au_id]
INNER JOIN [dbo].[titles] as t2 ON t1.[title_id] = t2.[title_id]
INNER JOIN [dbo].[publishers] as pu ON t2.[pub_id] = pu.[pub_id];*/

/*SELECT au.[au_id] as [AUTHOR ID], au.[au_lname] as [LAST NAME],au.[au_fname] as [FIRST NAME], pu.[pub_name] as [PUBLISHER], COUNT(t2.title_id) AS [TITLE COUNT]
FROM [dbo].[authors] as au
    INNER JOIN [dbo].[titleauthor] as t1 ON au.[au_id] = t1.[au_id]
    INNER JOIN [dbo].[titles] as t2 ON t1.[title_id] = t2.[title_id]
    INNER JOIN [dbo].[publishers] as pu ON t2.[pub_id] = pu.[pub_id]
    GROUP BY au.[au_id],au.[au_lname],au.[au_fname], pu.[pub_name];*/

/*SELECT TOP (3) au.[au_id] as [AUTHOR ID], au.[au_lname] as [LAST NAME],au.[au_fname] as [FIRST NAME], COUNT(t1.title_id) AS [TOTAL]
FROM [dbo].[authors] as au
    LEFT JOIN [dbo].[titleauthor] as t1 ON au.[au_id] = t1.[au_id]
    GROUP BY au.[au_id],au.[au_lname],au.[au_fname]
    ORDER BY TOTAL DESC;*/

/*SELECT TOP (23) au.[au_id] as [AUTHOR ID], au.[au_lname] as [LAST NAME],au.[au_fname] as [FIRST NAME], COUNT(t1.title_id) AS [TOTAL]
FROM [dbo].[authors] as au
    LEFT JOIN [dbo].[titleauthor] as t1 ON au.[au_id] = t1.[au_id]
    GROUP BY au.[au_id],au.[au_lname],au.[au_fname]
    ORDER BY TOTAL DESC;*/


-------------------------------------------------------- [advanced-mysql] --------------------------------------------------------
    -------------------------------------------------------- DESAFIO 1 --------------------------------------------------------
-- Paso 1 
/*SELECT TA.au_id
        ,TA.title_id
        ,T.advance * TA.royaltyper / 100 as Advance
        ,T.price * SA.qty * T.royalty / 100 * TA.royaltyper / 100 as Royalty
    FROM dbo.titleauthor TA, dbo.titles T, dbo.sales SA
    WHERE TA.title_id = T.title_id and T.title_id = SA.title_id;

--Paso 2
SELECT TA.au_id
        ,TA.title_id
        ,SUM(T.advance * TA.royaltyper / 100) as Advance
        ,SUM(T.price * SA.qty * T.royalty / 100 * TA.royaltyper / 100) as Royalty
    INTO Resultado
    FROM dbo.titleauthor TA, dbo.titles T, dbo.sales SA
    WHERE TA.title_id = T.title_id and T.title_id = SA.title_id
    GROUP BY TA.au_id, TA.title_id;

--Paso 3
SELECT TOP (3) RE.au_id as ID_Autor
        ,SUM(RE.Advance + RE.Royalty) as Profits
    FROM dbo.Resultado RE
    GROUP BY RE.au_id
    ORDER BY Profits DESC;*/



-------------------------------------------------------- DESAFIO 2--------------------------------------------------------
--Paso 1
/*DROP TABLE step_1
SELECT TA.au_id
        ,TA.title_id
        ,T.advance * TA.royaltyper / 100 as Advance
        ,T.price * SA.qty * T.royalty / 100 * TA.royaltyper / 100 as Royalty
        INTO step_1
    FROM dbo.titleauthor TA, dbo.titles T, dbo.sales SA
    WHERE TA.title_id = T.title_id and T.title_id = SA.title_id;

--Paso 2
DROP TABLE step_2
    SELECT P1.au_id
        ,P1.title_id
        ,SUM(P1.Advance) as Advance
        ,SUM(P1.Royalty) as Royalty
        INTO step_2
    FROM dbo.step_1 P1
    GROUP BY P1.au_id, P1.title_id;

--Paso 3
SELECT TOP (3) P2.au_id as ID_Autor
        ,SUM(P2.Advance + P2.Royalty) as Profits
        INTO most_profiting_authors
    FROM dbo.step_2 P2
    GROUP BY P2.au_id
    ORDER BY Profits DESC;*/

-------------------------------------------------------- DESAFIO 3--------------------------------------------------------   
 /*SELECT TOP (3) P2.au_id as ID_Autor
        ,SUM(P2.Advance + P2.Royalty) as Profits
        INTO most_profiting_authors
    FROM dbo.step_2 P2
    GROUP BY P2.au_id
    ORDER BY Profits DESC;*/