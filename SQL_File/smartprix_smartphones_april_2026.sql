-- All mobiles with price
SELECT 
    brand_name, 
    model, 
    price 
FROM smartphones 
ORDER BY 
    price ASC;

-- All budget phones
    SELECT 
    brand_name, 
    model, 
    price 
FROM smartphones 
WHERE price_category = 'Budget'
ORDER BY price ASC;

-- All Mid-Range phones
SELECT 
    brand_name, 
    model, 
    price 
FROM smartphones 
WHERE price_category = 'Mid-Range'
ORDER BY price ASC;

-- All premium phones
SELECT 
    brand_name, 
    model, 
    price 
FROM smartphones 
WHERE price_category = 'Premium'
ORDER BY price ASC;

-- All Flagship phones
SELECT 
    brand_name, 
    model, 
    price 
FROM smartphones 
WHERE price_category = 'Flagship'
ORDER BY price ASC;

-- which processor each phones cantains
SELECT 
    brand_name, 
    model, 
    processor_brand,
    processor_name
FROM smartphones 
ORDER BY processor_brand ASC;

-- All processor with speed
SELECT
processor_brand, 
processor_name,
processor_speed
FROM smartphones 
ORDER BY processor_speed DESC;

-- Spec_score of each phone
SELECT 
    brand_name, 
    model, 
    spec_score 
FROM smartphones 
ORDER BY spec_score DESC;

-- All phones with vfm_score
SELECT 
    brand_name, 
    model, 
    vfm_score 
FROM smartphones 
ORDER BY vfm_score DESC;

-- All mobiles with RAM and MEMORY
SELECT 
    brand_name, 
    model, 
    ram,
    memory,
    price
FROM smartphones 
ORDER BY 
    price_category ASC, 
    price ASC;

-- Budget phones with more tham median specs-scores
WITH BudgetSpecs AS (
    SELECT 
        brand_name,
        model,
        spec_score,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY spec_score) OVER() AS median_spec
    FROM smartphones
    WHERE price_category = 'Budget'
)
SELECT 
    'Budget' AS category,
    brand_name,
    model,
    spec_score,
    median_spec AS category_median_spec,
    price
FROM BudgetSpecs
WHERE spec_score > median_spec
ORDER BY 
    spec_score DESC;

    -- Mid-Range phones with more tham median specs-scores
    WITH MidRangeSpecs AS (
    SELECT 
        brand_name,
        model,
        spec_score,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY spec_score) OVER() AS median_spec
    FROM smartphones
    WHERE price_category = 'Mid-Range'
)
SELECT 
    'Mid-Range' AS category,
    brand_name,
    model,
    spec_score,
    median_spec AS category_median_spec,
    price
FROM MidRangeSpecs
WHERE spec_score > median_spec
ORDER BY 
    spec_score DESC;

-- Premium phones with more tham median specs-scores
WITH PremiumSpecs AS (
    SELECT 
        brand_name,
        model,
        spec_score,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY spec_score) OVER() AS median_spec
    FROM smartphones
    WHERE price_category = 'Premium'
)
SELECT 
    'Premium' AS category,
    brand_name,
    model,
    spec_score,
    median_spec AS category_median_spec,
    price
FROM PremiumSpecs
WHERE spec_score > median_spec
ORDER BY 
    spec_score DESC;

    -- Flagship phones with more tham median specs-scores
    WITH FlagshipSpecs AS (
    SELECT 
        brand_name,
        model,
        spec_score,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY spec_score) OVER() AS median_spec
    FROM smartphones
    WHERE price_category = 'Flagship'
)
SELECT 
    'Flagship' AS category,
    brand_name,
    model,
    spec_score,
    median_spec AS category_median_spec,
    price
FROM FlagshipSpecs
WHERE spec_score > median_spec
ORDER BY 
    spec_score DESC;

-- Budget phones with more than median processor speed and num-core
WITH BudgetProcessors AS (
    SELECT 
        brand_name,
        model,
        processor_name,
        processor_speed,
        num_core,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY processor_speed) OVER() AS median_speed,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY num_core) OVER() AS median_core
    FROM smartphones
    WHERE price_category = 'Budget'
)
SELECT 
    'Budget' AS category,
    brand_name,
    model,
    processor_name,
    num_core,
    median_core AS category_median_core,
    processor_speed,
    median_speed AS category_median_speed,
    price
FROM BudgetProcessors
WHERE processor_speed > median_speed 
  AND num_core >= median_core
ORDER BY 
    processor_speed DESC,
    num_core DESC;

    -- Mid-Range phones with more than median processor speed and num-core
    WITH MidRangeProcessors AS (
    SELECT 
        brand_name,
        model,
        processor_name,
        processor_speed,
        num_core,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY processor_speed) OVER() AS median_speed,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY num_core) OVER() AS median_core
    FROM smartphones
    WHERE price_category = 'Mid-Range'
)
SELECT 
    'Mid-Range' AS category,
    brand_name,
    model,
    processor_name,
    num_core,
    median_core AS category_median_core,
    processor_speed,
    median_speed AS category_median_speed,
    price
FROM MidRangeProcessors
WHERE processor_speed > median_speed 
  AND num_core >= median_core
ORDER BY 
    processor_speed DESC,
    num_core DESC;


     -- Premium  phones with more than median processor speed and num-core
     WITH PremiumProcessors AS (
    SELECT 
        brand_name,
        model,
        processor_name,
        processor_speed,
        num_core,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY processor_speed) OVER() AS median_speed,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY num_core) OVER() AS median_core
    FROM smartphones
    WHERE price_category = 'Premium'
)
SELECT 
    'Premium' AS category,
    brand_name,
    model,
    processor_name,
    num_core,
    median_core AS category_median_core,
    processor_speed,
    median_speed AS category_median_speed,
    price
FROM PremiumProcessors
WHERE processor_speed > median_speed 
  AND num_core >= median_core
ORDER BY 
    processor_speed DESC,
    num_core DESC;



      -- Flagship phones with more than median processor speed and num-core
      WITH FlagshipProcessors AS (
    SELECT 
        brand_name,
        model,
        processor_name,
        processor_speed,
        num_core,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY processor_speed) OVER() AS median_speed,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY num_core) OVER() AS median_core
    FROM smartphones
    WHERE price_category = 'Flagship'
)
SELECT 
    'Flagship' AS category,
    brand_name,
    model,
    processor_name,
    num_core,
    median_core AS category_median_core,
    processor_speed,
    median_speed AS category_median_speed,
    price
FROM FlagshipProcessors
WHERE processor_speed > median_speed 
  AND num_core >= median_core
ORDER BY 
    processor_speed DESC,
    num_core DESC;


 -- Budget phones with more than Median RAM and ROM
 WITH BudgetMemory AS (
    SELECT 
        brand_name,
        model,
        ram,
        memory,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ram) OVER() AS median_ram,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY memory) OVER() AS median_rom
    FROM smartphones
    WHERE price_category = 'Budget'
)
SELECT 
    'Budget' AS category,
    brand_name,
    model,
    ram,
    median_ram AS category_median_ram,
    memory AS rom,
    median_rom AS category_median_rom,
    price
FROM BudgetMemory
WHERE ram > median_ram 
  AND memory > median_rom
ORDER BY 
    ram DESC,
    memory DESC;


 -- Mid-Range phones with more than Median RAM and ROM
 WITH MidRangeMemory AS (
    SELECT 
        brand_name,
        model,
        ram,
        memory,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ram) OVER() AS median_ram,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY memory) OVER() AS median_rom
    FROM smartphones
    WHERE price_category = 'Mid-Range'
)
SELECT 
    'Mid-Range' AS category,
    brand_name,
    model,
    ram,
    median_ram AS category_median_ram,
    memory AS rom,
    median_rom AS category_median_rom,
    price
FROM MidRangeMemory
WHERE ram > median_ram 
  AND memory > median_rom
ORDER BY 
    ram DESC,
    memory DESC;

 -- Premium phones with more than Median RAM and ROM
 WITH PremiumMemory AS (
    SELECT 
        brand_name,
        model,
        ram,
        memory,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ram) OVER() AS median_ram,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY memory) OVER() AS median_rom
    FROM smartphones
    WHERE price_category = 'Premium'
)
SELECT 
    'Premium' AS category,
    brand_name,
    model,
    ram,
    median_ram AS category_median_ram,
    memory AS rom,
    median_rom AS category_median_rom,
    price
FROM PremiumMemory
WHERE ram > median_ram 
  AND memory > median_rom
ORDER BY 
    ram DESC,
    memory DESC;


-- Flagship phones with more than Median RAM and ROM
WITH FlagshipMemory AS (
    SELECT 
        brand_name,
        model,
        ram,
        memory,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY ram) OVER() AS median_ram,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY memory) OVER() AS median_rom
    FROM smartphones
    WHERE price_category = 'Flagship'
)
SELECT 
    'Flagship' AS category,
    brand_name,
    model,
    ram,
    median_ram AS category_median_ram,
    memory AS rom,
    median_rom AS category_median_rom,
    price
FROM FlagshipMemory
WHERE ram > median_ram 
  AND memory > median_rom
ORDER BY 
    ram DESC,
    memory DESC;

-- Average Values phones
SELECT 
    brand_name,
    model,
    price
FROM smartphones
WHERE vfm_label = 'Average value'
ORDER BY price ASC;


-- Overpriced phones
SELECT 
    brand_name,
    model,
    price
FROM smartphones
WHERE vfm_label = 'Overpriced'
ORDER BY price DESC;

-- Value kings
SELECT 
    brand_name,
    model,
    price
FROM smartphones
WHERE vfm_label = 'Value king'
ORDER BY price ASC;

-- performence beast phones
SELECT 
    brand_name,
    model,
    price
FROM smartphones
WHERE vfm_label = 'Performance beast'
ORDER BY price ASC;


-- All phones which has 5G
SELECT 
    brand_name,
    model,
    price
FROM smartphones
WHERE has_5g = 'True' 
ORDER BY price ASC;

-- All phones has NFC
SELECT 
    brand_name,
    model,
    price
FROM smartphones
WHERE has_nfc = 'True'
ORDER BY price ASC;

-- All phones with IR
SELECT 
    brand_name,
    model,
    price
FROM smartphones
WHERE has_ir = 'True' 
ORDER BY price ASC;

-- Phones with Screen Size
SELECT 
    brand_name,
    model,
    screen_size,
    price
FROM smartphones
ORDER BY screen_size DESC;

-- phones with refresh rate
SELECT 
    brand_name,
    model,
    refresh_rate,
    price
FROM smartphones
ORDER BY refresh_rate DESC;


-- Phones with charging speed and charging ratio
SELECT 
    brand_name,
    model,
    fast_charging_w,
    charging_ratio,
    price
FROM smartphones
ORDER BY fast_charging_w DESC;



-- Budget Phones with more than median charging speed and charging ratio
WITH BudgetCharging AS (
    SELECT 
        brand_name,
        model,
        fast_charging_w,
        charging_ratio,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY fast_charging_w) OVER() AS median_speed,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY charging_ratio) OVER() AS median_ratio
    FROM smartphones
    WHERE price_category = 'Budget'
)
SELECT 
    'Budget' AS category,
    brand_name,
    model,
    fast_charging_w,
    median_speed AS category_median_speed,
    charging_ratio,
    median_ratio AS category_median_ratio,
    price
FROM BudgetCharging
WHERE fast_charging_w > median_speed 
  AND charging_ratio > median_ratio
ORDER BY 
    fast_charging_w DESC,
    charging_ratio DESC;


-- Mid-Range Phones with more than median charging speed and charging ratio
WITH MidRangeCharging AS (
    SELECT 
        brand_name,
        model,
        fast_charging_w,
        charging_ratio,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY fast_charging_w) OVER() AS median_speed,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY charging_ratio) OVER() AS median_ratio
    FROM smartphones
    WHERE price_category = 'Mid-Range'
)
SELECT 
    'Mid-Range' AS category,
    brand_name,
    model,
    fast_charging_w,
    median_speed AS category_median_speed,
    charging_ratio,
    median_ratio AS category_median_ratio,
    price
FROM MidRangeCharging
WHERE fast_charging_w > median_speed 
  AND charging_ratio > median_ratio
ORDER BY 
    fast_charging_w DESC,
    charging_ratio DESC;

-- Premium Phones with more than median charging speed and charging ratio
WITH PremiumCharging AS (
    SELECT 
        brand_name,
        model,
        fast_charging_w,
        charging_ratio,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY fast_charging_w) OVER() AS median_speed,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY charging_ratio) OVER() AS median_ratio
    FROM smartphones
    WHERE price_category = 'Premium'
)
SELECT 
    'Premium' AS category,
    brand_name,
    model,
    fast_charging_w,
    median_speed AS category_median_speed,
    charging_ratio,
    median_ratio AS category_median_ratio,
    price
FROM PremiumCharging
WHERE fast_charging_w > median_speed 
  AND charging_ratio > median_ratio
ORDER BY 
    fast_charging_w DESC,
    charging_ratio DESC;

-- Flagship Phones with more than median charging speed and charging ratio
WITH FlagshipCharging AS (
    SELECT 
        brand_name,
        model,
        fast_charging_w,
        charging_ratio,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY fast_charging_w) OVER() AS median_speed,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY charging_ratio) OVER() AS median_ratio
    FROM smartphones
    WHERE price_category = 'Flagship'
)
SELECT 
    'Flagship' AS category,
    brand_name,
    model,
    fast_charging_w,
    median_speed AS category_median_speed,
    charging_ratio,
    median_ratio AS category_median_ratio,
    price
FROM FlagshipCharging
WHERE fast_charging_w > median_speed 
  AND charging_ratio > median_ratio
ORDER BY 
    fast_charging_w DESC,
    charging_ratio DESC;

    -- 'Fast Charging' Smartphones
    SELECT 
    brand_name,
    model,
    fast_charging_w_type,
    price
FROM smartphones
WHERE fast_charging_w_type = 'Fast charging'
ORDER BY price ASC;

-- Slow Charging' Smartphones
SELECT 
    brand_name,
    model,
    fast_charging_w_type,
    price
FROM smartphones
WHERE fast_charging_w_type = 'Slow charging'
ORDER BY price ASC;

-- 'Standard' Charging Smartphones
SELECT 
    brand_name,
    model,
    fast_charging_w_type,
    price
FROM smartphones
WHERE fast_charging_w_type = 'Standard'
ORDER BY price ASC;

-- All Models by Front and Rear Camera
SELECT 
    brand_name,
    model,
    front_camera,
    rear_camera,
    price
FROM smartphones
ORDER BY front_camera DESC;

 -- All Budget Models by Front and Rear Camera
 WITH BudgetCameras AS (
    SELECT 
        brand_name,
        model,
        front_camera,
        rear_camera,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY front_camera) OVER() AS median_front,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY rear_camera) OVER() AS median_rear
    FROM smartphones
    WHERE price_category = 'Budget'
)
SELECT 
    'Budget' AS category,
    brand_name,
    model,
    front_camera,
    median_front AS category_median_front,
    rear_camera,
    median_rear AS category_median_rear,
    price
FROM BudgetCameras
WHERE front_camera > median_front 
  AND rear_camera > median_rear
ORDER BY 
    rear_camera DESC,
    front_camera DESC;

 -- All Mid-Range Models by Front and Rear Camera
 WITH MidRangeCameras AS (
    SELECT 
        brand_name,
        model,
        front_camera,
        rear_camera,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY front_camera) OVER() AS median_front,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY rear_camera) OVER() AS median_rear
    FROM smartphones
    WHERE price_category = 'Mid-Range'
)
SELECT 
    'Mid-Range' AS category,
    brand_name,
    model,
    front_camera,
    median_front AS category_median_front,
    rear_camera,
    median_rear AS category_median_rear,
    price
FROM MidRangeCameras
WHERE front_camera > median_front 
  AND rear_camera > median_rear
ORDER BY 
    rear_camera DESC,
    front_camera DESC;

 --  All Flagship Models by Front and Rear Camera
WITH FlagshipCameras AS (
    SELECT 
        brand_name,
        model,
        front_camera,
        rear_camera,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY front_camera) OVER() AS median_front,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY rear_camera) OVER() AS median_rear
    FROM smartphones
    WHERE price_category = 'Flagship'
)
SELECT 
    'Flagship' AS category,
    brand_name,
    model,
    front_camera,
    median_front AS category_median_front,
    rear_camera,
    median_rear AS category_median_rear,
    price
FROM FlagshipCameras
WHERE front_camera > median_front 
  AND rear_camera > median_rear
ORDER BY 
    rear_camera DESC,
    front_camera DESC;


     --  All premium Models by Front and Rear Camera
WITH PremiumCameras AS (
    SELECT 
        brand_name,
        model,
        front_camera,
        rear_camera,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY front_camera) OVER() AS median_front,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY rear_camera) OVER() AS median_rear
    FROM smartphones
    WHERE price_category = 'Premium'
)
SELECT 
    'Premium' AS category,
    brand_name,
    model,
    front_camera,
    median_front AS category_median_front,
    rear_camera,
    median_rear AS category_median_rear,
    price
FROM PremiumCameras
WHERE front_camera > median_front 
  AND rear_camera > median_rear
ORDER BY 
    rear_camera DESC,
    front_camera DESC;

-- All Models by Rear Camera Count
SELECT 
    brand_name,
    model,
    rear_camera_count,
    price
FROM smartphones
ORDER BY rear_camera_count DESC;

-- All Models by Operating System
SELECT 
    brand_name,
    model,
    os,
    price
FROM smartphones
ORDER BY 
    os ASC, 
    price ASC;

    -- Budget phones with more than median vfm- score 
WITH PremiumVFMs AS (
    SELECT 
        brand_name,
        model,
        vfm_score,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY vfm_score) OVER() AS median_vfm
    FROM smartphones
    WHERE price_category = 'Budget'
)
SELECT 
    'Budget' AS category,
    brand_name,
    model,
    vfm_score,
    median_vfm AS category_median_vfm,
    price
FROM PremiumVFMs
WHERE vfm_score > median_vfm
ORDER BY 
    vfm_score DESC;


-- Mid-Range phones with more than median vfm- score 
WITH PremiumVFMs AS (
    SELECT 
        brand_name,
        model,
        vfm_score,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY vfm_score) OVER() AS median_vfm
    FROM smartphones
    WHERE price_category = 'Mid-Range'
)
SELECT 
    'Mid-Range' AS category,
    brand_name,
    model,
    vfm_score,
    median_vfm AS category_median_vfm,
    price
FROM PremiumVFMs
WHERE vfm_score > median_vfm
ORDER BY 
    vfm_score DESC;


    -- Premium phones with more than median vfm- score 
WITH PremiumVFMs AS (
    SELECT 
        brand_name,
        model,
        vfm_score,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY vfm_score) OVER() AS median_vfm
    FROM smartphones
    WHERE price_category = 'Premium'
)
SELECT 
    'Premium' AS category,
    brand_name,
    model,
    vfm_score,
    median_vfm AS category_median_vfm,
    price
FROM PremiumVFMs
WHERE vfm_score > median_vfm
ORDER BY 
    vfm_score DESC;



-- Flagship phones with more than median vfm- score 
WITH PremiumVFMs AS (
    SELECT 
        brand_name,
        model,
        vfm_score,
        price,
        PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY vfm_score) OVER() AS median_vfm
    FROM smartphones
    WHERE price_category = 'Flagship'
)
SELECT 
    'Flagship' AS category,
    brand_name,
    model,
    vfm_score,
    median_vfm AS category_median_vfm,
    price
FROM PremiumVFMs
WHERE vfm_score > median_vfm
ORDER BY 
    vfm_score DESC;


