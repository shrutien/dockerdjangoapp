FROM python:3.7

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1


# create root directory for our project in the container
RUN mkdir /django_docker

#Set the working directory to /django_docker
WORKDIR /django_docker

# Copy the current directory contents into the container at /django_docker
COPY . /django_docker


# Install any needed packages specified in requirements.txt
RUN pip install -U pip && pip install -r requirements.txt

EXPOSE 9999
EXPOSE 5432

CMD ["python", "manage.py", "runserver", "0.0.0.0:9999"]