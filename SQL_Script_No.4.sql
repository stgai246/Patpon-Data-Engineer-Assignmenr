ALTER TABLE genres
MODIFY gen_title INT;

UPDATE genres
SET gen_title = (CASE gen_title
                   WHEN 'Action' THEN 1
                   WHEN 'Adventure' THEN 2
                   WHEN 'Animation' THEN 3
                   WHEN 'Biography' THEN 4
                   WHEN 'Comedy' THEN 5
                   WHEN 'Crime' THEN 6
                   WHEN 'Drama' THEN 7
                   WHEN 'Horror' THEN 8
                   WHEN 'Music' THEN 9
                   WHEN 'Mystery' THEN 10
                   WHEN 'Romance' THEN 11
                   WHEN 'Thriller' THEN 12
                   WHEN 'War' THEN 13
                   ELSE gen_title
                   END);
