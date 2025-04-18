FROM jupyter/pyspark-notebook:latest

# Set working directory
WORKDIR /app

# Install extra Python packages
RUN pip install delta-spark h5py pandas matplotlib mlflow seaborn scikit-learn jupyterlab numpy==1.23.5

# Optional: expose port for Jupyter (already done in base image)
EXPOSE 8888