# retailco
This is a simple exercise of cleaning messy customer data, importing that into a database and providing some insignts about the data.

## Development Environment
For this exercise I'm using Google Sheets for cleaning operations on provided xlsx file. I'll be running MySQL image in a PodMan container on my Mac. With this, we don't need to install MySQL server locally.
Podman Desktop or Docker Desktop can be installed on Mac, Windows and Linux.
Once the installation is done, run the docker-compose.yaml file:
```
podman compose -f docker/docker-compose.yaml up
```
This will pull the MySQL docker image and initialize the container.

Note: Replace the password placeholders in the docker-compose.yaml
