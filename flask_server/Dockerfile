# start with a base image
FROM python:3.9

# update working directories
ADD . .
WORKDIR .

# install dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install zbar-tools -y
RUN apt-get install libzbar-dev -y
RUN apt-get install libgl1-mesa-glx -y
RUN pip3 install -r requirements.txt



EXPOSE 3000
CMD ["python3", "app.py"]