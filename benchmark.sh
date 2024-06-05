# Variables
ITERATIONS=$1
OUTPUT_FILE="benchmark_output-standard.txt"

# Check if the number of iterations is provided
if [ -z "$ITERATIONS" ]; then
    echo "Please provide the number of iterations"
    exit 1
fi

# Check if the output file exists
if [ -f "$OUTPUT_FILE" ]; then
    echo "Output file already exists. Please remove it before running the benchmark"
    exit 1
fi

IMAGE_NAME="hello-world/standard:latest"

# Run the benchmark
for i in $(seq 1 $ITERATIONS); do
    echo "Running iteration $i"
    echo "Running iteration $i" >> $OUTPUT_FILE

    CONTAINER_NAME="benchmark-container-$i"

    docker run -it --name $CONTAINER_NAME $IMAGE_NAME | grep "Execution" >> $OUTPUT_FILE
    CREATION_TIME=$(docker inspect --format='{{.Created}}' $CONTAINER_NAME)
    START=$(docker inspect --format='{{.State.StartedAt}}' $CONTAINER_NAME)
    STOP=$(docker inspect --format='{{.State.FinishedAt}}' $CONTAINER_NAME)

    CREATION_TIMESTAMP=$(date --date=$CREATION_TIME +%s%3N)
    START_TIMESTAMP=$(date --date=$START +%s%3N)
    STOP_TIMESTAMP=$(date --date=$STOP +%s%3N)

    echo Container created in $(($START_TIMESTAMP-$CREATION_TIMESTAMP)) miliseconds >> $OUTPUT_FILE
    echo Run executed in $(($STOP_TIMESTAMP-$START_TIMESTAMP)) miliseconds >> $OUTPUT_FILE

    docker rm $CONTAINER_NAME
miliseconds
    echo "------------------------------------------" >> $OUTPUT_FILE
done