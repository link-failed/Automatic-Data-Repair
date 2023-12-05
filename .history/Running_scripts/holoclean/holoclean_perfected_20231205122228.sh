#!/bin/bash
TASK_LIST=("hospital" "beers" "rayyan" "flights")
CNTS_LIST=(1 2 3)
for CNT in "${CNTS_LIST[@]}"
do
    
    NUMS_LIST=('01')
    PYTHON="/data/nw/DC_ED/References_inner_and_outer/holoclean-master/holoclean_run.py"

    # Loop through error rates and run holoclean_run.py on dataset
    for TASK in "${TASK_LIST[@]}"
    do        
        for NUM in "${NUMS_LIST[@]}"
        do                
            TASK_NAME="${TASK}${CNT}"
            DIRTY_DATA="/data/nw/DC_ED/References/DATASET/data with dc_rules/${TASK}/noise/${TASK}-inner_outer_error-"
            CLEAN_DATA="/data/nw/DC_ED/References/DATASET/data with dc_rules/${TASK}/clean.csv"
            RULE="/data/nw/DC_ED/References/DATASET/data with dc_rules/${TASK}/dc_rules_holoclean.txt"
            DIRTY_DATA_PATH="${DIRTY_DATA}${NUM}.csv"
            COMMAND="timeout 1d /home/dell/anaconda3/envs/torch110/bin/python $PYTHON --task_name \"$TASK_NAME\" --rule_path \"$RULE\" --onlyed 0 --perfected 1 --dirty_path \"$DIRTY_DATA_PATH\" --clean_path \"$CLEAN_DATA\" \&"
            { eval "$COMMAND" || echo "Timeout reached: $(date) ${COMMAND}" ; } 2>&1 | tee -a "./aggre_results/timeout_log.txt" 
        done
    done
done

