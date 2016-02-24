-- How many products do we have?
SELECT count(1)
FROM dell_store.products

-- How many order line items do we have?
SELECT count(1)
FROM dell_store.orderlines

-- What are the prices and how many products have each price?
SELECT price, count(1)
FROM dell_store.products
GROUP BY price
ORDER BY price

-- What are the product categories and how many products are there?
SELECT categoryname, count(1)
FROM dell_store.products AS p
JOIN dell_store.categories AS c ON c.category = p.category
GROUP BY categoryname
ORDER BY categoryname

-- Join products and order lines
SELECT *
FROM dell_store.products AS p
JOIN dell_store.orderlines AS ol on ol.prod_id = p.prod_id
LIMIT 10 -- this is important because we have so much data

-- Products with no orders
SELECT p.*
FROM dell_store.products AS p
LEFT JOIN dell_store.orderlines AS ol on ol.prod_id = p.prod_id
WHERE ol.prod_id IS NULL

-- Products out of stock
SELECT *
FROM dell_store.products AS p
JOIN dell_store.inventory AS ol on ol.prod_id = p.prod_id
WHERE quan_in_stock = 0



-- Committees with no candidate
SELECT com.*
FROM fec.committee AS com
LEFT OUTER JOIN fec.candidate AS can ON com.candidate_identification = can.candidate_identification
WHERE com.state = 'WA'
AND com.file_year = 16
AND can.candidate_identification IS NULL


-- Committees with no donations
SELECT com.*
FROM fec.committee AS com
LEFT OUTER JOIN fec.committee_summary AS cs ON com.committee_id = cs.committee_id
WHERE com.state = 'WA'
AND com.file_year = 16
AND cs.committee_id IS NULL


-- Crime's zip code
SELECT crime.cad_cdw_id, zip.geoid10
FROM data.seattle_crime as crime
JOIN geo.zip AS zip ON ST_Intersects(zip.geom, ST_GeomFromText('POINT(' || longitude || ' ' || latitude || ')', 4269))
LIMIT 100