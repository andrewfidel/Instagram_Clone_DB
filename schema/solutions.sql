-- 1. Find 5 oldest users
SELECT *
FROM users
ORDER BY created_at
LIMIT 5;

-- 2. Most popular registration date
SELECT
  DAYNAME(created_at) AS day_of_week,
  COUNT(*) AS total
FROM users
GROUP BY day_of_week
ORDER BY total DESC
LIMIT 2;

-- 3. Identify inactive users (users with no photos)
SELECT *
FROM users
LEFT JOIN photos
ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- 4. Who's the most popular person with most popular photo
-- gives us the total number of likes for a photo (its id & image_url)
SELECT
 username,
 photos.image_url,
 photos.id,
 COUNT(*) AS total
 -- total number of users who liked a photo
FROM photos
INNER JOIN likes
  ON likes.photo_id = photos.id
INNER JOIN users
  ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 5;

-- 5. Calculate average number of photos per user
SELECT
   (SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users)
      AS avg;

-- 6. What are the 5 most commonly used hashtags
SELECT
  photo_tags.tag_id,
  tags.tag_name,
  COUNT(*) AS total
FROM photo_tags
JOIN tags
ON photo_tags.tag_id = tags.id
GROUP BY tag_id
ORDER BY total DESC
LIMIT 5;

-- 7. Finding bots - users who liked every photo
-- HAVING filters condition from the group we used
SELECT
  username,
  COUNT(*) num_of_likes
FROM users
INNER JOIN likes
ON users.id = likes.user_id
GROUP by users.id
HAVING num_of_likes =
  (
    SELECT COUNT(*) FROM photos
  );
