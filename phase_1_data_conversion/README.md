# **Phase 1: Convert Raw Data to Delta Lake**
--------------------------------------------

This phase converts the raw HDF5 files from the CNC Machining dataset into a structured Delta Lake table. Using PySpark inside the Docker container, we extract vibration data from each `.h5` file, add metadata from filenames and folder structure, and write the transformed data into a partitioned Delta Lake format. This makes the data queryable, scalable, and suitable for downstream machine learning and analytics.

✅ By the end of this phase, you will have a functioning Delta Lake table containing all converted data from `data/raw`.

---

### **1.1 Process HDF5 Files and Write to Delta Lake**

📓 Notebook to run:  
`phase_1_data_ingestion/hdf5_to_delta_lake.ipynb`

This notebook performs the following:

- Walks the folder structure under `data/raw/` to locate `.h5` files
- Reads each file using `h5py` and extracts the `vibration_data` array
- Parses metadata from the file name (`machine_id`, `month`, `year`, `operation`, `example_no`)
- Appends the label (`good` / `bad`) from the folder path
- Writes each file’s data as a partitioned Delta table under `data/delta/`
- Skips files that have already been processed
- Logs all successes and failures to `successful_files.txt` and `failed_files.txt`
- Includes multithreaded processing and memory optimization for efficiency

🧠 Tip: This step may take 3–4 hours depending on your machine. You can monitor progress through a tqdm-based progress bar.

---

### **1.2 Verify Delta Table Contents**

📓 Notebook to run:  
`phase_1_data_ingestion/verify_delta_lake.ipynb`

This notebook initializes a new Spark session and verifies that the data was successfully loaded into the Delta Lake table by:

- Reading the Delta table from `data/delta`
- Counting the total number of unique files ingested
- Showing the number of labeled examples (`good` vs `bad`)
- Printing a few rows of sample data and checking schema consistency

✅ What success looks like:

- Spark successfully reads the Delta table
- You see approximately the expected number of unique files (e.g., ~1700)
- Counts by label match expectations (e.g., majority "good", minority "bad")

---

### **🧠 Concepts Introduced in Phase 1**

- Delta Lake partitioning and transactional log
- Multithreaded file processing with Python's `concurrent.futures`
- PySpark DataFrame transformations and I/O
- Schema enforcement and memory management in Spark

---

### ⚠️ Troubleshooting Tips

- If you're running out of memory, reduce the number of threads in `hdf5_to_delta_lake.ipynb`
- If Spark throws type errors, ensure that all data columns are cast to `float64` before writing
- If you're seeing duplicate data, ensure uniqueness is defined by `machine_id`, `month`, `year`, `operation`, and `example_no`

---

### 🏁 Phase 1 Complete!

You now have a scalable, partitioned, Delta Lake table ready for querying and analysis. In Phase 2, you'll begin exploring the data to identify signal characteristics and detect anomalies in the vibration signals.