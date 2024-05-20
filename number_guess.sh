#!/bin/bash

# Database connection variable
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align --quiet -c"

echo "Enter your username: "
read USERNAME

# Validate username length
if [[ ${#USERNAME} -gt 22 ]]
then
  echo "Username must be 22 characters or less."
  exit 1
fi

# Check if the user exists in the database
USER_INFO=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_INFO ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  USER_ID=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME') RETURNING user_id")

else
  USER_ID=$(echo $USER_INFO | cut -d "|" -f 1)
  USERNAME=$(echo $USER_INFO | cut -d "|" -f 2)

  # Get games played and best game
  GAME_STATS=$($PSQL "SELECT COUNT(game_id), MIN(number_of_guesses) FROM games WHERE user_id = $USER_ID AND game_won = TRUE GROUP BY user_id")
  GAMES_PLAYED=$(echo $GAME_STATS | cut -d "|" -f 1)
  BEST_GAME=$(echo $GAME_STATS | cut -d "|" -f 2)

  if [[ -z $GAMES_PLAYED ]]
  then
    GAMES_PLAYED=0
    BEST_GAME=0
  fi

  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
fi

# Start a new game
SECRET_NUMBER=$(( 1 + RANDOM % 1000))
GAME_ID=$($PSQL "INSERT INTO games(user_id,secret_number) VALUES($USER_ID, $SECRET_NUMBER) RETURNING game_id")
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000: "

while true
do
  read USER_GUESS

  # Validate guess
  if ! [[ $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again: "
    continue
  fi

  ((NUMBER_OF_GUESSES++))

  # Check guess
  if [[ $USER_GUESS -eq $SECRET_NUMBER ]]
  then
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    RESULT=$($PSQL "UPDATE games SET number_of_guesses = $NUMBER_OF_GUESSES, game_won = TRUE WHERE game_id = $GAME_ID")
    break
  elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again: "
  elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again: "
  fi
done