#!/bin/bash
TASK_LIST=("hospital" "beers" "rayyan" "flights")
CNTS_LIST=(1 2 3)
for CNT in "${CNTS_LIST[@]}"
do
    # Loop through error rates and run holoclean_run.py on dataset
    NUMS_LIST=('01')
    for NUM in "${NUMS_LIST[@]}"
    do        
        for TASK in "${TASK_LIST[@]}"
        do
            DIRTY_DATA="/data/nw/DC_ED/References/DATASET/data with dc_rules/${TASK}/noise/${TASK}-inner_outer_error-"
            CLEAN_DATA="/data/nw/DC_ED/References/DATASET/data with dc_rules/${TASK}/clean.csv"
            RULE="/data/nw/DC_ED/References/DATASET/data with dc_rules/${TASK}/dc_rules_holoclean.txt"
            PYTHON="/data/nw/DC_ED/References_inner_and_outer/Daisy/daisy.py"
            TASK_NAME="${TASK}${CNT}"
            DIRTY_DATA_PATH="${DIRTY_DATA}${NUM}.csv"
            
            COMMAND="timeout 1d /home/dell/anaconda3/envs/torch110/bin/python $PYTHON --task_name \"$TASK_NAME\" --rule_path \"$RULE\" --onlyed 0 --perfected 1 --dirty_path \"$DIRTY_DATA_PATH\" --clean_path \"$CLEAN_DATA\" \&"
            { eval "$COMMAND" || echo "Timeout reached: $(date) ${COMMAND}" ; } 2>&1 | tee -a "./aggre_results/timeout_log.txt"
        done
        wait
    done
done

