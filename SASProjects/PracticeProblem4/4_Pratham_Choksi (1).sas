*Pratham Choksi
*2/11/2022;

PROC IMPORT OUT= WORK.BaltCrime 
            DATAFILE= "C:\Users\prath\OneDrive\Desktop\COMPUTER SCIENCE\
stats321\BPD_Part_1_Victim_Based_Crime_Data.txt" 
            DBMS=TAB REPLACE;
	 DELIMITER = ',';
	 GETNAMES=YES;
     DATAROW=2; 
RUN;

*Creates a library;
libname CMData 'C:\\Users\\prath\\Desktop';

*Imports the data into CMData library;
DATA CMData.BaltCrime;
	SET BaltCrime;
RUN;

* The number of crimes using a Firearm for 2019 is 5158;
PROC SQL;
	SELECT count(year(CrimeDate))
	FROM CMData.BaltCrime
	WHERE Weapon = "FIREARM" AND
	year(CrimeDate) = 2019
QUIT;


*The number of crimes by each district for 2019;
PROC SQL;
	SELECT district, count(district) AS Num_of_Crimes
	FROM CMData.BaltCrime
	WHERE year(CrimeDate) = 2019
	GROUP BY district;
QUIT;

*The number of crimes by each district for 2018;
PROC SQL;
	SELECT district, count(district) AS Num_of_Crimes
	FROM CMData.BaltCrime
	WHERE year(CrimeDate) = 2018
	GROUP BY district;
QUIT;

*The number of Firearm crimes by neighborhood per year;
PROC SQL;
	SELECT neighborhood, year(CrimeDate) AS year, count(Weapon) AS Num_of_Firearm_Crimes
	FROM CMData.BaltCrime
	WHERE Weapon = "FIREARM"
	GROUP BY neighborhood, year
	ORDER BY neighborhood;
QUIT;

*The number of Firearm crimes per year;
PROC SQL;
	SELECT year(CrimeDate) AS year, count(Weapon) AS Num_of_Firearm_Crimes
	FROM CMData.BaltCrime
	WHERE Weapon = "FIREARM"
	GROUP BY year;
QUIT;

*will show the number of Aggravated Assaults by month under the assigned Crime Code;
PROC SQL;
	SELECT CrimeCode, Month(CrimeDate) AS month, count(Description) AS Agg_Assault
	FROM CMData.BaltCrime
	WHERE Description = "AGG. ASSAULT"
	GROUP BY month
	ORDER BY CrimeCode; 
QUIT;

*will show the number of Common Assaults by year under the assigned Crime Code;
PROC SQL;
	SELECT CrimeCode, year(CrimeDate) AS year, count(Description) AS Common_Assault
	FROM CMData.BaltCrime
	WHERE Description = "COMMON ASSAULT"
	GROUP BY year
	ORDER BY CrimeCode; 
QUIT;


*This code creates two tables, one with common assault and one with aggravated assault then I combined the two to be both in one table;
PROC SQL;
	CREATE TABLE CMData.Common_Assault AS
	SELECT year(CrimeDate) AS year, count(Description) AS Assault
	FROM CMData.BaltCrime
	WHERE Description = "COMMON ASSAULT"
	GROUP BY year
	ORDER BY year;

	CREATE TABLE CMData.Agg_Assault AS
	SELECT year(CrimeDate) AS year, count(Description) AS Assault
	FROM CMData.BaltCrime
	WHERE Description = "AGG. ASSAULT"
	GROUP BY year
	ORDER BY year;


	CREATE TABLE CMData.Aggcom AS
	SELECT  a.year, 
			a.Assault AS Agg_Assault, 
			b.Assault AS Common_Assault
	FROM CMData.Agg_Assault AS a,
		 CMData.Common_Assault AS b
	WHERE a.year = b.year;
QUIT;
