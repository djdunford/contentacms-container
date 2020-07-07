# contentacms-container
Build a containerised version of the contentacms quick install as described at https://www.contentacms.org/
### Pre-requisites
A Docker engine must be installed
### Installation
Clone the repo, cd in to the repo root directory and run `docker build . -t contentacms`. Note the randomly-generated
admin password will be shown in the console output at the end of the build.
### Run
`docker run -d -p 8888:8888 contentacms`
### Notes
This is based on the quick install and uses SQLite as the backend store within the container. As such it is ephemeral,
when the container shuts down (use `docker kill`) this database, and any content uploaded, is lost forever...


