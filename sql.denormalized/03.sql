SELECT
    lang,
    count(*) as count
FROM (
    SELECT DISTINCT
        data->>'id' as id_tweets,
        data->>'lang' as lang
    FROM tweets_jsonb
    WHERE data->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
       OR data->'extended_tweet'->'entities'->'hashtags' @@ '$[*].text == "coronavirus"'
) t
GROUP BY (1)
ORDER BY count DESC, lang;
