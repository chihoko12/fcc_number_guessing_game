psql --username=freecodecamp --dbname=postgres \n
pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql \n
psql -U postgres < number_guess.sql
