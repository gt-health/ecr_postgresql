# Use the Postgres image as a base
FROM postgres:alpine

# Define environment variable
ENV POSTGRES_PASSWORD "changeme"

# Copy database backup to the /opt/data/ folder
#COPY ecrdb.bk /opt/data/ecrdb.bk
ADD *.sql /opt/data/
RUN chmod -R -v a+rwx /opt/data

# Add a loadDb.sh to docker-entrypoint-initdb.d so it is run at the end of the start up process to configure the database
COPY loadDb.sh /docker-entrypoint-initdb.d/loadDb.sh
RUN chmod -v a+rwx /docker-entrypoint-initdb.d/loadDb.sh

EXPOSE 5432
