# Automatic-Data-Repair

The running environment requirements are in `environment.yml`

You can use scripts in `/Running_scripts` to run all the data repair experiments

The optimization experiment is in `./raha-master/improvement_with_raha.py` and `./raha-master/improvement_with_raha-tax.py`

The downstream experiments are executed by `.repair_mltest_classification.py` and `.repair_mltest_regression.py` 

# Evaluation for CMPT-984

* datasets for experiment: /CMPT984/datasets

* data repair for Raha-Baran: /raha-master/raha/correction.py
  * path of dirty dataset: line 645
  * path of clean dataset: line 646
  * This script also outputs the metrics (precision, recall and F1_score). But as we discussed in evaluation session, it is not meaningful.

* convert Raha-Baran's result back into csv, so we can use LLM to evaluate it: CMPT984/datasets/flights_new/error-correction/transform.py
  * the repaired result by Raha-Baran will be in: MPT984/datasets/flights_new/error-correction/correction.csv