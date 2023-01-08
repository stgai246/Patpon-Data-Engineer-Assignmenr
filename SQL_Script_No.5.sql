UPDATE actor
SET act_gender = 'F'
WHERE (
  act_fname LIKE 'Em%' OR
  act_fname LIKE 'Char%' OR
  act_lname LIKE '%dy' OR
  act_lname '%sy' OR
  act_lname '%lia'
);