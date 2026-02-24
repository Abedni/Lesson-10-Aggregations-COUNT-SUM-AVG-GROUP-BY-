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
SELECT AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS overall_Property_AVG
from PROPERTYData
--22. What is the average property price per province?
SELECT PROVINCE,AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS average_property_Per_Province
FROM PropertyData
group by  PROVINCE
--23. What is the average property price per city?
SELECT CITY,AVG(CAST(PROPERTY_PRICE AS BIGINT)) AS average_property_Per_CITY
FROM PropertyData
group by CITY
--24. What is the average number of bedrooms per province?
SELECT PROVINCE,AVG(CAST(BEDROOMS AS bigint)) AS Average_number_of_BEDROOMS_PR_PROVINCE
FROM PropertyData
GROUP BY PROVINCE
--25. What is the average number of bathrooms per province?
SELECT PROVINCE,AVG(CAST(BATHROOMS AS bigint)) AS Average_number_of_BATHROOMS_PR_PROVINCE
FROM PropertyData
GROUP BY PROVINCE
--26. What is the average floor size per province?
SELECT PROVINCE,AVG(CAST(FLOOR_SIZE AS bigint)) AS Average_floor_size_pr_Province
from PropertyData
group by PROVINCE
--27. What is the average monthly repayment per province?
SELECT PROVINCE,AVG(CAST(monthly_repayment AS BIGINT)) AS average_monthly_repayment_per_province
FROM PropertyData
GROUP BY PROVINCE
--28. What is the average once-off cost per province?
SELECT PROVINCE,AVG(CAST(Total_Once_off_Costs as bigint)) as average_once_off_cost_per_province
from PropertyData
group by PROVINCE
--29. What is the average minimum gross monthly income per province?
SELECT PROVINCE,AVG(CAST(Min_Gross_Monthly_Income as bigint)) as avg_min_gross_monthly_income_pr_province
from PropertyData
group by PROVINCE
--30. What is the average property price for properties above R3,000,000?
SELECT AVG(CAST(property_price as bigint))as average_property_price_for_Properties_GT_R3000000
FROM PropertyData
WHERE property_price > 3000000
--SECTION 4 – GROUP BY + Filtering (10 Questions)
--31. Which province has the highest average property price?
SELECT TOP 1 PROVINCE,PROPERTY_PRICE,AVG(CAST(PROPERTY_PRICE AS BIGINT)) as highest_average_property
from PropertyData
Group by PROVINCE,PROPERTY_PRICE
order by PROPERTY_PRICE desc

--32. Which province has the lowest average property price?
SELECT TOP 1 PROVINCE,PROPERTY_PRICE,AVG(CAST(PROPERTY_PRICE as bigint)) as lowest_average_property
from PropertyData
group by PROVINCE,PROPERTY_PRICE
order by PROPERTY_PRICE asc

--33. Which city has the highest total property value?
SELECT TOP 1 CITY, PROPERTY_PRICE,SUM(CAST(PROPERTY_PRICE as bigint)) as highest_total_property_Value
from PropertyData
group by CITY,PROPERTY_PRICE
ORDER BY PROPERTY_PRICE DESC
--34. Which city has the lowest average property price?
SELECT top 1 CITY,PROPERTY_PRICE,AVG(CAST(PROPERTY_PRICE as bigint)) as lowest_average_property_price
from PropertyData
group by city,PROPERTY_PRICE
order by PROPERTY_PRICE asc
--35. How many properties per province are priced above R2,000,000?
SELECT Province,COUNT(*) AS Properties_GT_2000000
from PropertyData
where PROPERTY_PRICE > 2000000
GROUP BY PROVINCE
--36. What is the average floor size per province for properties above R3,000,000?
SELECT PROVINCE,AVG(CAST(floor_size as bigint)) as AVG_Floor_size_pr_Province_Properties_GT_3000000
FROM PropertyData
WHERE PROPERTY_PRICE > 3000000
GROUP BY PROVINCE
--37. What is the total property value per province for properties with 3 or more bedrooms?
SELECT Province,SUM(CAST(PROPERTY_PRICE AS bigint)) as Tt_prValue_pr_Province_fr_Properties_wth_gteq3
from PropertyData
where BEDROOMS >=3
group by Province
--38. What is the average monthly repayment per province for properties above R4,000,000?
SELECT PROVINCE,AVG(CAST(Monthly_repayment as bigint)) as average_monthly_repayment
from PropertyData
where PROPERTY_PRICE > 4000000
group by PROVINCE
--39. How many properties per city have parking for 2 or more cars?
SELECT CITY,COUNT(PARKING) AS Number_parking_with_2_or_more_cars
FROM PropertyData
WHERE PARKING >=2
GROUP BY CITY

--40. What is the average minimum gross monthly income per province for properties above R5,000,000?
SELECT PROVINCE,AVG(CAST(Min_gross_Monthly_Income as bigint))as AVG_Min_grs_Monthly_inc_Pr_province_prop_GT_5000000
from PropertyData
where PROPERTY_PRICE > 5000000
Group by PROVINCE