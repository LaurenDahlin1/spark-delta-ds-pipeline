#!/bin/bash

# Create main phase folders with READMEs
for phase in \
  "phase_0_environment_setup" \
  "phase_1_data_conversion" \
  "phase_2_exploration_analysis" \
  "phase_3_modeling" \
  "phase_4_deployment_databricks"
do
  mkdir -p "$phase"
  touch "$phase/README.md"
done


# Create data folder structure
# mkdir -p data/raw
mkdir -p data/delta

# Add core project files
touch README.md
touch .gitignore

echo "Project scaffold created successfully."
