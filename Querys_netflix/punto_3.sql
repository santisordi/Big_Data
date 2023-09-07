USE netflix;

SELECT
  COUNT(id_production) AS count_null_id_production,
  COUNT(id_content) AS count_null_id_content,
  COUNT(title_production) AS count_null_title_production,
  COUNT(genre) AS count_null_genre,
  COUNT(premiere) AS count_null_premiere,
  COUNT(runtime) AS count_null_runtime,
  COUNT(imdb_score) AS count_null_imdb_score,
  COUNT(language) AS count_null_language
FROM production;

USE netflix;
select id_production, id_content, title_production, genre, premiere, runtime,imdb_score, language from production

USE netflix;

USE netflix;

SELECT 
    id_production, 
    id_content, 
    title_production, 
    genre, 
    premiere, 
    runtime,
    imdb_score, 
    language,
    (SELECT COUNT(*) FROM production WHERE id_production IS NULL) AS null_id_production,
    (SELECT COUNT(*) FROM production WHERE id_production IS NOT NULL) AS not_null_id_production,
    (SELECT COUNT(*) FROM production WHERE id_production = '') AS empty_id_production,
    (SELECT COUNT(DISTINCT id_production) FROM production) AS distinct_id_production,
    (SELECT COUNT(*) FROM production WHERE id_content IS NULL) AS null_id_content,
    (SELECT COUNT(*) FROM production WHERE id_content IS NOT NULL) AS not_null_id_content,
    (SELECT COUNT(*) FROM production WHERE id_content = '') AS empty_id_content,
    (SELECT COUNT(DISTINCT id_content) FROM production) AS distinct_id_content
FROM production;



SELECT COUNT(*) AS id_production FROM production 
WHERE id_production IS NOT NULL;


