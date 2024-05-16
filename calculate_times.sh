CONTAINER_NAME=$1

CREATION_TIME=$(docker inspect --format='{{.Created}}' $CONTAINER_NAME)
START=$(docker inspect --format='{{.State.StartedAt}}' $CONTAINER_NAME)
STOP=$(docker inspect --format='{{.State.FinishedAt}}' $CONTAINER_NAME)

CREATION_TIMESTAMP=$(date --date=$CREATION_TIME +%s%3N)
START_TIMESTAMP=$(date --date=$START +%s%3N)
STOP_TIMESTAMP=$(date --date=$STOP +%s%3N)

echo Container created in $(($START_TIMESTAMP-$CREATION_TIMESTAMP)) miliseconds
echo Run executed in $(($STOP_TIMESTAMP-$START_TIMESTAMP)) miliseconds