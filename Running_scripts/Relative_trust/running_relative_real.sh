#!/bin/bash

# Define variables
TASK_LIST=("hospital" "beers" "rayyan" "flights")

for TASK in "${TASK_LIST[@]}"
do
    DIRTY_DATA="./data_with_rules/${TASK}/noise/${TASK}-inner_outer_error-"
    CLEAN_DATA="./data_with_rules/${TASK}/clean.csv"
    RULE="./data_with_rules/${TASK}/dc_rules-validate-fd-horizon.txt"
    NUMS_LIST=('01')
    CNTS_LIST=(1 2 3)
    PYTHON="./Relative_Trust/relative.py"

    # Loop through error rates and run holoclean_run.py on dataset
    for NUM in "${NUMS_LIST[@]}"
    do        
        for CNT in "${CNTS_LIST[@]}"
        do                
            TASK_NAME="${TASK}${CNT}"
            DIRTY_DATA_PATH="${DIRTY_DATA}${NUM}.csv"
            
            timeout 1d /home/dell/anaconda3/envs/torch110/bin/python $PYTHON --task_name "$TASK_NAME" --rule_path "$RULE" --onlyed 0 --perfected 0 --dirty_path "$DIRTY_DATA_PATH" --clean_path "$CLEAN_DATA" &
            
        done
    done
done

