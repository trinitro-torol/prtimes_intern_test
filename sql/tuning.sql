-- tuning.sql

-- Check if index 'idx_post_created' exists
SET @index_exists := (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = DATABASE()
    AND table_name = 'comments'
    AND index_name = 'idx_post_created'
);

-- Dynamically add the index only if it doesn't exist
SET @sql := IF(@index_exists = 0,
  'ALTER TABLE comments ADD INDEX idx_post_created (post_id, created_at DESC)',
  'SELECT "Index already exists";');

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
