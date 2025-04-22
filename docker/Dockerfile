# Note: At the time of writing, spark 3.5.0 does not support Delta Lake 2.4.0
# Therefore, we use spark 3.4.1
# Use the official Jupyter PySpark notebook image with Spark 3.4.1
FROM jupyter/pyspark-notebook:spark-3.4.1

# Set working directory
WORKDIR /app

# Install extra Python packages
RUN pip install delta-spark h5py pandas matplotlib mlflow seaborn scikit-learn jupyterlab numpy==1.23.5 plotly

# Add Delta Lake JAR to Spark
ENV DELTA_VERSION=2.4.0
ENV SCALA_VERSION=2.12

# Unfortunately, you need to be root to install the JAR in the Spark directory
USER root
RUN wget https://repo1.maven.org/maven2/io/delta/delta-core_${SCALA_VERSION}/${DELTA_VERSION}/delta-core_${SCALA_VERSION}-${DELTA_VERSION}.jar \
-P $SPARK_HOME/jars/ && \
wget https://repo1.maven.org/maven2/io/delta/delta-storage/${DELTA_VERSION}/delta-storage-${DELTA_VERSION}.jar \
-P $SPARK_HOME/jars/
USER $NB_UID

# Optional: expose port for Jupyter (already done in base image)
EXPOSE 8888