#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above #

# Svuota le tabelle rispettando le FK
$PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY" > /dev/null

# Inserisci i 24 team unici
tail -n +2 games.csv | cut -d, -f3,4 | tr ',' '\n' | sort -u | while IFS= read -r TEAM
do
  $PSQL "INSERT INTO teams(name) VALUES(\$\$$TEAM\$\$)" > /dev/null
done

# Inserisci le 32 partite
tail -n +2 games.csv | while IFS=, read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = \$\$$WINNER\$\$")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = \$\$$OPPONENT\$\$")
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, \$\$$ROUND\$\$, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)" > /dev/null
done
