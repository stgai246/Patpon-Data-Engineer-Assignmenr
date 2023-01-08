SELECT director.dir_id, director.dir_fname, director.dir_lname, movie_direction.mov_id, movie.mov_id, actor.act_id, actor.act_fname, actor.act_lname, actor.act_gender, movie_cast.mov_id, movie.mov_id
FROM director
JOIN movie_direction ON director.dir_id = movie_direction.dir_id
JOIN movie ON movie_direction.mov_id = movie.mov_id
JOIN movie_cast ON movie.mov_id = movie_cast.mov_id
JOIN actor ON movie_cast.act_id = actor.act_id

WHERE act_gender ='F'
GROUP BY director.dir_id, director.dir_fname, director.dir_lname, movie_direction.mov_id, movie.mov_id, actor.act_id, actor.act_fname, actor.act_lname, actor.act_gender, movie_cast.mov_id, movie.mov_id 
ORDER BY director.dir_id DESC