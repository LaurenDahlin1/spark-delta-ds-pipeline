# spark-delta-ds-pipeline

This project demonstrates a modern, reproducible data science workflow
using Python, Delta Lake, and Apache Spark. Starting from raw vibration
data stored in HDF5 format, the project walks through local development
and analysis, feature engineering, anomaly detection modeling, and
ultimately deployment on Databricks for scalable production workflows.
It serves as a practical guide for transitioning from exploratory
Jupyter notebooks to robust, big data-ready pipelines.

**🎯 Learning Goals**
--------------------

This project is designed to provide hands-on experience with the full
lifecycle of a modern data science project, including:

-   🐳 **Setting up a reproducible coding environment** using Docker, VS Code, and Python

-   🔄 **Converting legacy data formats** (HDF5) to modern big data formats (Delta Lake)

-   📊 **Exploring time series sensor data** using Pandas, Spark, and
    visualization libraries

-   📈 **Engineering features** for anomaly detection from raw
    accelerometer signals

-   🤖 **Training and evaluating machine learning models** on time series data

-   📁 **Managing and querying data at scale** using Apache Spark and Delta Lake

-   🧪 **Tracking experiments** using MLflow for model development and evaluation

-   🚀 **Transitioning from local development to cloud deployment** using
    Databricks

-   🔄 **Working with version-controlled, modular Python scripts** for scalable workflows

**📦 Data Attribution**
----------------------

This project uses publicly available data from the **CNC Machining**
dataset published by Bosch Research.

**Citation:**

Tnani, Mohamed-Ali; Feil, Michael; Diepold, Klaus. *Smart Data
Collection System for Brownfield CNC Milling Machines: A New Benchmark
Dataset for Data-Driven Machine Monitoring.* Procedia CIRP 2022, 107,
131--136.\
DOI:
[10.1016/j.procir.2022.04.022](https://doi.org/10.1016/j.procir.2022.04.022)

If using this dataset, please cite the paper above and direct any
dataset-related questions to [Tnani
Mohamed-Ali](mailto:mohamed-ali.tnani@boschrexroth.de).

**Source Repository:** 🔗
[https://github.com/boschresearch/CNC_Machining](https://github.com/boschresearch/CNC_Machining)

**License**: The dataset is licensed under the Creative Commons
Attribution 4.0 International License (CC BY 4.0).

**Dataset Description:**

-   The dataset includes real-world vibration data from three CNC
    milling machines executing 15 processes over six labeled
    timeframes from **October 2018 to August 2021**
-   Acceleration was measured using a **tri-axial Bosch CISS Sensor** at
    a **2 kHz sampling rate**
-   Files are stored in **HDF5 format** and labeled as either good
    (normal) or bad (anomalous)
-   Each .h5 file contains a 2D array of acceleration data with axes: X, Y, Z

**📂 Project Phases & Folder Structure**
---------------------------------------

This project is organized into five clearly defined phases, each
representing a stage in the data science workflow---from environment
setup to scalable model deployment. Each phase has its own directory
containing relevant code, scripts, and a README with documentation
specific to that step.

### **🟪 phase_0\_environment_setup/**

> **Goal:** Establish a reproducible and modular development
> environment.

-   Set up a structured project repository with clear folder organization and version control
-   Use Docker to create a consistent, containerized Python + Spark environment
-   Configure VS Code to run and develop code directly inside the Docker container
-   Ensure all required Python libraries and tools (e.g., Spark, Delta Lake, h5py) are installed and functional
-   Verify the setup by running a Jupyter notebook from inside the container

### **🟦 phase_1\_data_conversion/**

> **Goal:** Convert raw HDF5 files into structured, scalable Delta Lake format using PySpark.

### **🟩 phase_2\_exploration_analysis/**

> **Goal:** Perform descriptive statistics and visualize patterns in the vibration data.

### **🟨 phase_3\_modeling/**

> **Goal:** Engineer features and train machine learning models to detect anomalies in time series data.

### **🟥 phase_4\_deployment_databricks/**

> **Goal:** Deploy the end-to-end pipeline to Databricks for scalable processing and analysis.
