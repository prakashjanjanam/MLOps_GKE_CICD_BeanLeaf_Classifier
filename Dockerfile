# lightweight Python
FROM python:3.7-slim
RUN apt-get update

# Copy local code to container
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

RUN ls -la $APP_HOME/

# Install Dependencies
RUN pip install -r requirements.txt
# Run the streamlit on container start-up
#CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 SAGunicorns
#CMD ["streamlit", "run", "--server.enableCORS" "false", "imgwebapp.py"]
#ENTRYPOINT ["streamlit", "run"]

#CMD ["imgwebapp.py"]

# Expose port
ENV PORT 8501

# cmd to launch app when container is run
CMD streamlit run imgwebapp.py
