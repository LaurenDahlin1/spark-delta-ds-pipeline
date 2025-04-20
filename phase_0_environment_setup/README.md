# **Phase 0: Project Setup & Environment**
----------------------------------------

This phase lays the foundation for the entire project by setting up a reproducible, containerized development environment using Docker and VS Code. You'll organize the project structure, configure Docker to run a Python + Spark environment, and connect VS Code directly to the container for seamless development. By the end of this phase, you'll have a fully functional setup capable of running PySpark and Delta Lake code from within Jupyter notebooks

### **0.1 Install VS Code and Extensions**

-   Download [Visual Studio Code](https://code.visualstudio.com/)
-   Note: I am working on a Mac. Some steps may be slightly different for you
-   Recommended: Click Set Up Co-Pilot and log into your GitHub account
-   Extensions I am using:
    -   Jupyter
    -   Docker
    -   Dev Containers
    -   Python

### **0.2 Create GitHub Repo and Add Dataset**

-   If you were starting this project from scratch (not forking this project)
    -   Fork the `CNC_Machining` repo to your Github account: [https://github.com/boschresearch/CNC_Machining](https://github.com/boschresearch/CNC_Machining)
    -   Clone the repo above from your Github account to add the files to your local machine
    -   Create a new repo on your Github account
    -   Clone the new repo
    -   Run the bash script to create the project folders (or create them manually); Be sure to cd into the new repo folder first:
        ```
        chmod +x ../path/to/script/init_project_spark-delta-ds-pipeline.sh
        ../path/to/script/init_project_spark-delta-ds-pipeline.sh
        ```
    -   Copy the raw data from the cloned repo to `data/raw` by copying the entire data folder and renaming it to `raw` *after* it is inside the project data folder
    -   Add a `.gitignore` entry for `data/data-raw` since the raw files are large.
    -   I also used [pandoc](https://pandoc.org/MANUAL.html) to convert some notes I was taking in a gdoc to markdown for my readmes:
        ```
        pandoc -f docx -t markdown -o "main.md" "Main Folder Readme.docx"
        ```

-   If you are forking this project, you will still need to add the raw data in order to run Phase 1, which is the data conversion to Delta Lake:
    -    Fork the `CNC_Machining` repo to your Github account: [https://github.com/boschresearch/CNC_Machining](https://github.com/boschresearch/CNC_Machining)
    -   Clone the repo above from your Github account to add the files to your local machine
    -   Copy the raw data from the cloned repo to `data/raw` by copying the entire data folder and renaming it to `raw` *after* it is inside the project data folder

⚠️ If you want to skip Phase 1, you can download a zip file of the data in Delta Lake from [My Google Drive](https://drive.google.com/file/d/14ypcXJg0_hz5hYZ6fk8aqHLTzvsHsD61/view?usp=sharing). This will allow you to run the code in Phases 2, 3, and 4.

### **0.3 Install Docker**

-   Download and install Docker Desktop: [https://docs.docker.com/desktop/setup/install](https://docs.docker.com/desktop/setup/install)
-   Allocate ~4–8GB memory via Docker settings for Spark

### **0.4 Set Up Docker Container for Local Development**

This project uses Docker to provide a reproducible Python environment with PySpark and Delta Lake. By containerizing the development environment, you ensure that your code runs consistently across machines, with all necessary dependencies installed and isolated.

You have two options for setting up the Docker container: building it locally from the provided files, or pulling a pre-built image from Docker Hub. Using the pre-built image is the only way to guarantee that the code is compatible with the packages and libraries used in the project.

#### 🔧 Option 0.4a: Build the Docker Container from Project Files

This method allows you to use the latest versions of packages, unless the version is specified in the Dockerfile. The Dockerfile is set up to install compatible versions of Spark and Delta Lake as of April 2025.

📁 Files Involved:

-   **Dockerfile**: Located in `docker/Dockerfile`. This defines the image, starting from `jupyter/pyspark-notebook`, and installs required Python packages:
    -   `delta-spark` for Delta Lake
    -   `h5py`, `pandas`, `scikit-learn`, `matplotlib`, `mlflow`, `ipykernel`, and others for data science and machine learning
    -   Sets the working directory to `/app`, which maps to your project root inside the container

-   **docker-compose.yml**: Located in `docker/docker-compose.yml`. This file tells Docker how to run the container:
    -   Mounts your project folder into the container at `/app`
    -   Exposes port 8888 (for Jupyter if used)
    -   Sets up environment variables and working directory

✅ Steps to Build and Run Locally:

1.  Navigate to the `docker/` folder in the terminal / command prompt:
    ```
    cd docker
    ```
2.  Build and run the container:
    ```
    docker-compose up --build
    ```

#### 🔧 Option 0.4b (Coming Soon!): Use the Pre-Built Docker Image from Docker Hub

If you don't want to build the container yourself, you can pull a pre-built image that includes all dependencies and configuration. I have not added this file yet.

### Step 0.5 --- Attach VS Code to the Docker Container

Once your Docker container is running—whether you built it locally (Option 04a) or pulled it from Docker Hub (Option 04b)—you can write and run code directly inside the container using VS Code. This ensures you're working within the containerized environment where all dependencies are installed and your code is mounted at `/app`.

⚠️ Don't edit or run code from your local machine—your mounted project inside the container is the correct working directory.

✅ Steps to Attach VS Code to the Docker Container:

1.  Open VS Code with the Docker extension installed. If you haven't installed it yet, search for "Docker" in the Extensions sidebar (Ctrl+Shift+X / Cmd+Shift+X on Mac) and install the one by Microsoft.
2.  Click the Docker icon in the left sidebar. This opens the Docker panel where you can view images, containers, and volumes.
3.  Start the container (if not already running). Under the Containers section, look for your container (likely named `docker-spark-notebook`). If it isn't running, right-click (or control-click) and select "Start".
4.  Attach to VS Code by right-click (or control-click) and selecting "Attach to VS Code".
5.  Navigate to the `/app` folder in the container. In the file bar or file explorer, open the `/app` folder. This is your mounted project directory—the full contents of your repo will be visible here. ⚠️ Do not open or work with files from your local machine path—always use `/app`.
6.  Install necessary extensions inside the container. VS Code extensions installed on your local machine do not carry over into the container. To install them:
    -   Click the Extensions icon in the sidebar
    -   Scroll down to "Container -- Installed"
    -   Find your container name, then:
        -   Click the ☁️ cloud button to install all local extensions, *or*
        -   Individually install key extensions like:
            -   Python
            -   Jupyter
7.  (Optional) Add extensions to `devcontainer.json` for future auto-install. Click the ⚙️ gear icon next to each installed extension, then choose:
    ```
    Add to devcontainer.json
    ```
    This ensures the extension will be available every time the container starts in VS Code.

### **Step 0.6 --- Run verify_environment.ipynb to Test Your Environment**

To confirm your development environment is properly set up inside the Docker container, run the test notebook provided in this project. This notebook checks that all required packages—such as PySpark, Delta Lake, h5py, pandas, and scikit-learn—are correctly installed and functional.

📄 File to Run:

`phase_0_environment_setup/verify_environment.ipynb`

This notebook includes:

-   A Python version check
-   Imports of key libraries (Spark, Delta, h5py, pandas, etc.)
-   Initialization of a Spark session with Delta Lake support

🧠 Notes on Running Python Notebooks in VS Code:

1.  **Rendering Markdown cells**: When editing a Markdown cell, you can preview the rendered formatting by clicking the checkmark button in the cell's edit toolbar (top-right corner of the cell).
2.  **Selecting the correct Python kernel**: The first time you run a code cell, VS Code will prompt you to **select a Python kernel**. You must choose the kernel that starts with:
    ```
    /opt/conda/bin/python
    ```
    This is the Python interpreter **inside the Docker container**. 
    ❗ Do **not** select your system's local Python interpreter (e.g., `/usr/bin/python` or anything outside `/opt`).

✅ What Success Looks Like:

-   All imports run without errors
-   The Spark session initializes and prints a version number (e.g., 3.11.6)
-   The notebook confirms that your container is ready for data processing and machine learning

### **🏁 Phase 0 Complete!**

You now have a fully containerized, reproducible Python + Spark environment ready to go. In the next phase, you'll begin converting raw HDF5 sensor data into a Delta Lake format to power large-scale analysis and anomaly detection.