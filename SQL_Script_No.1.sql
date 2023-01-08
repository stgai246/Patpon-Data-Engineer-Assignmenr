SQL Script 
SELECT DISTINCT (director.dir_id), director.dir_fname, director.dir_lname, movie_genres.gen_id, genres.gen_title, MAX(num_o_ratings)
       
FROM director 
INNER JOIN movie_direction
ON director.dir_id = movie_direction.dir_id

INNER JOIN movie_genres
ON movie_direction.mov_id =  movie_genres.mov_id

INNER JOIN genres
ON movie_genres.gen_id = genres.gen_id


INNER JOIN rating
ON movie_direction.mov_id = rating.mov_id


GROUP BY director.dir_id, director.dir_fname, director.dir_lname, movie_genres.gen_id, genres.gen_title, rating.num_o_ratings 
ORDER BY max DESC       
