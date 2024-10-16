-- Get the name of the store and its URL where any spices were purchased.
SELECT 
    s.store_name, 
    a.url_address
FROM 
    spices_stores s
JOIN 
    store_address a ON s.store_id = a.store_id
JOIN 
    all_stores st ON s.store_id = st.store_id;



-- Get the name of the store and its URL where spices were purchased, including their barcode.
SELECT 
    s.store_name, 
    a.url_address, 
    s.barcode
FROM 
    spices_stores s
JOIN 
    store_address a ON s.store_id = a.store_id
JOIN 
    all_stores st ON s.store_id = st.store_id;


-- Get stores who only have an online address.
SELECT 
    s.store_name, 
    a.url_address
FROM 
    all_stores s
JOIN 
    store_address a ON s.store_id = a.store_id
WHERE 
    a.physical_address IS NULL;


-- Get stores who have an online and a physical address.
SELECT 
    s.store_name, 
    a.url_address, 
    a.physical_address
FROM 
    all_stores s
JOIN 
    store_address a ON s.store_id = a.store_id
WHERE 
    a.physical_address IS NOT NULL 
    AND a.url_address IS NOT NULL;

-- Get spices whose names are also brands. For example, Fresh Direct is a store that also makes spices.
SELECT 
    spice_name, 
    brand 
FROM 
    spices 
WHERE 
    brand IN (SELECT DISTINCT spice_name FROM spices);


-- Get spices whose names contain “cinnamon”.
SELECT 
    spice_name, 
    net_weight_in_oz, 
    brand, 
    barcode 
FROM 
    spices 
WHERE 
    spice_name LIKE %cinnamon%;


-- Get the brand name of the Sumac spice and the name and URL of the store where it was purchased.
SELECT 
    s.brand AS spice_brand,
    st.store_name,
    sa.url_address
FROM 
    spices s
JOIN 
    spices_stores ss ON s.spice_name = ss.spice_name AND s.barcode = ss.barcode
JOIN 
    all_stores st ON ss.store_id = st.store_id
JOIN 
    store_address sa ON st.store_id = sa.store_id
WHERE 
    s.spice_name = Sumac;

