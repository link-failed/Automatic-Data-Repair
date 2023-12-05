#!/bin/bash

# Define variables
TASK_LIST=("hospital" "beers" "flights" "rayyan")
NUMS_LIST=(10 30 50 70 90)
TIME_LIST=(60 60 1200 1200 1200)
CNTS_LIST=(1)
TIME_CNT=0

# Create an array to store the process IDs of the background commands
pids=()

for CNT in "${CNTS_LIST[@]}"
do
    # Loop through error rates and run holoclean_run.py on dataset
    for NUM in "${NUMS_LIST[@]}"
    do        
        for TASK in "${TASK_LIST[@]}"
        do 
            DIRTY_DATA="./data_with_rules/${TASK}/noise/${TASK}-inner_outer_error-"
            CLEAN_DATA="./data_with_rules/${TASK}/clean.csv"
            RULE="./data_with_rules/${TASK}/dc_rules-validate-fd-horizon.txt"
            
            PYTHON="/data/nw/DC_ED/References_inner_and_outer/SCAREd/scared.py"
            TASK_NAME="${TASK}${CNT}"
            DIRTY_DATA_PATH="${DIRTY_DATA}${NUM}.csv"
            
            /home/dell/anaconda3/envs/torch110/bin/python $PYTHON --task_name "$TASK_NAME" --rule_path "$RULE" --onlyed 0 --perfected 0 --dirty_path "$DIRTY_DATA_PATH" --clean_path "$CLEAN_DATA" &
            sleep ${TIME_LIST[TIME_CNT]}
        done
        wait
        ((TIME_CNT++))
    done
done


# for pid in "${pids[@]}"
# do
#     wait $pid
#     exit_code=$?
#     if [ $exit_code -eq 124 ]; then
#         echo "COMMAND time out: ${COMMAND}" >> "./aggre_results/timeout_log.txt"
#     fi
# done
# pids=()