#!/bin/bash
PSQL="psql -X -U freecodecamp -d number_guess --no-align --tuples-only -c"

CONSULTAR_USERNAME(){

  USER_ID=$($PSQL"SELECT user_id FROM users_games WHERE username='$USERNAME'")
  if [[ -z $USER_ID ]]
  then 
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    ADD_USERNAME=$($PSQL"INSERT INTO users_games(username) VALUES ('$USERNAME')")
    USER_ID=$($PSQL"SELECT user_id FROM users_games WHERE username='$USERNAME'")
    GAMES_PLAYED=$($PSQL"SELECT games_played FROM users_games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL"SELECT best_game FROM users_games WHERE user_id=$USER_ID")

  else
    GAMES_PLAYED=$($PSQL"SELECT games_played FROM users_games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL"SELECT best_game FROM users_games WHERE user_id=$USER_ID")
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

PLAY_GAME(){

  SECRET_NUMBER=$(( 1 + RANDOM % 1000))
  echo -e "Guess the secret number between 1 and 1000:"
  GUESS=0
  NUMBER_OF_GUESSES=0

  while [[ $SECRET_NUMBER != $GUESS ]]
  do 
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then echo -e "That is not an integer, guess again:"
    else
      if [[ $GUESS -gt $SECRET_NUMBER ]]
      then 
        echo -e "It's lower than that, guess again:"
      else
        echo -e "It's higher than that, guess again:"
      fi
      (( NUMBER_OF_GUESSES ++ ))
    fi

  done

  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

}

HACER_REGISTRO(){
  (( GAMES_PLAYED ++ ))
  UPDATE_GAMES_PLAYED=$($PSQL"UPDATE users_games SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID")
  
  if [[ $BEST_GAME = 0 ]]
  then SET_BEST_GAME=$($PSQL"UPDATE users_games SET best_game=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID")
  else
    if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
    then
      SET_BEST_GAME=$($PSQL"UPDATE users_games SET best_game=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID")
    fi
  fi
}

echo "Enter your username:"
read USERNAME

CONSULTAR_USERNAME
PLAY_GAME
HACER_REGISTRO