FROM python:latest

# the working directory for docker instructions has
# been changed to where our application is going
# to be installed
WORKDIR /opt/ff-server

COPY requirements.txt .

RUN pip install -r requirements.txt

# copy the correct python script to the current working directory
COPY . ff-app

EXPOSE 5000

# an entrypoint has been set here
# the Python binary is executed, with the correct script as an argument
ENTRYPOINT ["/usr/local/bin/python", "ff-app/app.py"]
