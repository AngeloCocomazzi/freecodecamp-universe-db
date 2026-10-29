#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above #

$PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY CASCADE" > /dev/null

tail -n +2 games.csv | cut -d, -f3,4 | tr ',' '\n' | sort -u | while IFS= read -r TEAM
do
  $PSQL "INSERT INTO teams(name) VALUES(\$\$$TEAM\$\$) ON CONFLICT (name) DO NOTHING" > /dev/null
done

tail -n +2 games.csv | while IFS=, read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = \$\$$WINNER\$\$")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = \$\$$OPPONENT\$\$")
  $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, \$\$$ROUND\$\$, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)" > /dev/null
done
