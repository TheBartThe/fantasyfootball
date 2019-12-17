FROM python:latest

# the working directory for docker instructions has
# been changed to where our application is going
# to be installed
WORKDIR /opt/ff-server

COPY requirements.txt .

RUN pip install -r requirements.txt

ENV FF_DB=fantasyfootball_db \
	FF_USER=root \
	FF_PASSWORD=root \
	FF_HOST=35.246.52.184 \
	FF_SECRET_KEY=fnb9t4tfhgiothu490tu345yh430953ty09y4ih

# copy the correct python script to the current working directory
COPY . ff-app

EXPOSE 5000

# an entrypoint has been set here
# the Python binary is executed, with the correct script as an argument
ENTRYPOINT ["/usr/local/bin/python", "ff-app/app.py"]
