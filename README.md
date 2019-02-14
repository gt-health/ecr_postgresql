# PostgreSQL database for ECR at the State Department (or Public Health Entity). This container has a schema called "ecr" with ECR case report table.

To install:
First, build the docker file.

`$ sudo docker build --build-arg POSTGRES_PASSWORD=<your_choice_of_password> -t ecr-postgres .`

Your password will also be for the "ecr_user" that will be created. "ecr" database will be created with the "ecr_user" has all privileges on. 

The ECR case report table (case_report) resides within ecr schema in the ecr database. 

To run this image:

`$ sudo docker run --name ecr-postgres -p 5432:5432 -d ecr-postgres:latest`
