--Lesson 10 – Aggregations (COUNT, SUM, AVG, GROUP BY)

--SECTION 1 – COUNT Aggregations (10 Questions)

--1. How many total properties are in the database?

SELECT COUNT(*)
FROM PropertyData

--2. How many properties are listed in each province?
SELECT Province, COUNT(PROVINCE) AS Number_of_properties
FROM PropertyData
group by Province

--3. How many properties are listed in each city?
Select City,COUNT(City) as Number_properties
from PropertyData
group by CITY

--4. How many properties have more than 2 bedrooms?
SELECT COUNT(*) as Number_of_properties
FROM PropertyData
WHERE BEDROOMS>2

--5. How many properties have 2 or more bathrooms?
SELECT COUNT(*) as Number_of_properties
FROM PropertyData
WHERE Bathrooms>=2
--6. How many properties have parking for at least 2 cars?
SELECT COUNT(*) AS Number_of_properties
FROM PropertyData
WHERE PARKING >=2
--7. How many properties are priced above R3,000,000?
SELECT COUNT(PROPERTY_PRICE) AS  Number_of_properties
FROM PropertyData
WHERE PROPERTY_PRICE >3000000
--8. How many properties are in Gauteng?
SELECT COUNT(PROVINCE) as Number_of_Properties_in_Gauteng
FROM PropertyData
WHERE PROVINCE='Gauteng'

--9. How many properties per province have floor size greater than 200?
SELECT PROVINCE,COUNT(PROVINCE) AS Number_of_Properties_With_Floor_Size_GT_200
FROM PropertyData
WHERE FLOOR_SIZE >200
group by PROVINCE
--10. How many distinct provinces are in the table?
SELECT DISTINCT COUNT(PROVINCE) AS Number_of_distinct_provinces
FROM PropertyData

--SECTION 2 – SUM Aggregations (10 Questions)

--11. What is the total value of all properties combined?
SELECT SUM(cast(PROPERTY_PRICE AS BIGINT)) As total_value
FROM PropertyData
--12. What is the total property value per province?
SELECT Province,SUM(Cast(PROPERTY_PRICE as BIGINT)) AS property_value_per_province
from PropertyData
group by PROVINCE
--13. What is the total property value per city?
SELECT CITY,SUM(Cast(PROPERTY_PRICE as BIGINT)) AS property_value_per_CITY
from PropertyData
group by CITY
--14. What is the total monthly repayment for all properties?
SELECT sum(cast(monthly_Repayment as BIGINT)) AS  total_monthly_repayment_for_all_properties
FROM Propertydata
--15. What is the total monthly repayment per province?
SELECT PROVINCE,SUM(CAST(monthly_repayment AS BIGINT))AS total_monthly_repayment_per_province
from PropertyData
group by PROVINCE

--16. What is the total once-off cost for all properties?
SELECT SUM(CAST(Total_Once_off_Costs AS bigint)) AS total_once_off_cost
FROM PropertyData
--17. What is the total once-off cost per province?
SELECT Province,sum(cast(Total_Once_off_costs as BIGINT)) AS once_off_cost_per_province
FROM PropertyData
GROUP BY province
--18. What is the total property value for Gauteng?
SELECT SUM(cast(PROPERTY_PRICE AS BIGINT)) As total_value_Gauteng
FROM PropertyData
where PROVINCE='Gauteng'
--19. What is the total property value for properties priced above R4,000,000?
SELECT SUM(cast(PROPERTY_PRICE AS BIGINT)) As total_value_Gauteng
FROM PropertyData
where PROPERTY_PRICE > 4000000
--20. What is the total minimum gross monthly income required per province?
SELECT PROVINCE,SUM(CAST(Min_Gross_Monthly_Income as bigint)) as total_minimum_gross_monthly_Per_Province
from propertydata
group by province
--SECTION 3 – AVG Aggregations (10 Questions)
--21. What is the average property price overall?
--22. What is the average property price per province?
--23. What is the average property price per city?
--24. What is the average number of bedrooms per province?
--25. What is the average number of bathrooms per province?
--26. What is the average floor size per province?
--27. What is the average monthly repayment per province?
--28. What is the average once-off cost per province?
--29. What is the average minimum gross monthly income per province?
--30. What is the average property price for properties above R3,000,000?
--SECTION 4 – GROUP BY + Filtering (10 Questions)
--31. Which province has the highest average property price?
--32. Which province has the lowest average property price?
--33. Which city has the highest total property value?
--34. Which city has the lowest average property price?
--35. How many properties per province are priced above R2,000,000?
--36. What is the average floor size per province for properties above R3,000,000?
--37. What is the total property value per province for properties with 3 or more bedrooms?
--38. What is the average monthly repayment per province for properties above R4,000,000?
--39. How many properties per city have parking for 2 or more cars?
--40. What is the average minimum gross monthly income per province for properties above R5,000,000?