SELECT DISTINCT (actor.act_id), actor.act_fname, actor.act_lname, movie.mov_title, movie.mov_time, rating.num_o_ratings
FROM actor
JOIN movie_cast ON actor.act_id = movie_cast.act_id
JOIN movie ON movie_cast.mov_id = movie.mov_id
JOIN rating ON movie.mov_id = rating.mov_id

WHERE num_o_ratings IS NOT NULL
ORDER BY act_id 
