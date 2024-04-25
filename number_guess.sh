#!/bin/bash

# Database connection variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "Enter your username: "
read USERNAME

# Validate username length
if [[ ${#USERNAME} -gt 22 ]]
then
  echo "Username must be 22 characters or less."
  exit 1
fi

# Check if the user exists in the database
USER_INFO=$($PSQL "SELECT * FROM users WHERE username= '$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
  echo -e "Guess the secret number between 1 and 1000:"
  read $USER_GUESS
else
  USER_ID=$(echo $USER_INFO | cut -d "|" -f 1)
  USERNAME=$(echo $USER_INFO | cut -d "|" -f 2)

  # Get games played and best game
  GAME_STATS=$($PSQL "SELECT COUNT(game_id), MIN(number-of_guesses) FROM games WHERE user_id = '$USER_ID' AND game_won = TRUE GROUP BY user_id")
  GAMES_PLAYED=$($echo $GAME_STATS | cut -d "|" -f 1)
  BEST_GAME=$($echo $GAME_STATS | cut -d "|" -f 2)

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start a new game
SECRET_NUMBER=$(( 1 + RANDOM % 1000))
GAME_ID=$($PSQL "INSERT INTO games(user_id,secret_number) VALUES($USER_ID, $SECRET_NUMBER) RETURNING game_id")
NMBER_OF_GUESSES=0

while true
do
  echo "Guess the secret number between 1 and 1000: "
  read GUESS

  # Validate guess
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again: "
    continue
  fi

  ((NUMBER_OF_GUESSES++))

  # Check guess
  if [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    RESULT=$($PSQL games SET number_of_guesses = $NUMBER_OF_GUESSES,game_eon = TRUE WHERE game_id = $GAME_ID)
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again: "
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again: "
  fi
done