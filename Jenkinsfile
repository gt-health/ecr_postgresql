#!/usr/bin/env groovy
pipeline{
    agent any

    //Define stages for the build process
    stages{
        //Define the deploy stage
        stage('Deploy'){
            steps{
                script{
                    docker.withRegistry('https://gt-build.hdap.gatech.edu'){
                        //Build and push the database image
                        def elrPostgresImage = docker.build("ecrpostgres:1.0", "-f ./Dockerfile ./")
                        elrPostgresImage.push('latest')
                    }
                }
            }
        }

        //Define stage to notify rancher
        stage('Notify'){
            steps{
                script{
                    //push to the HDAP-SMARTonFHIR stack
                    rancher confirm: true, credentialId: 'gt-rancher-server', endpoint: 'https://gt-rancher.hdap.gatech.edu/v2-beta', environmentId: '1a7', environments: '', image: 'gt-build.hdap.gatech.edu/ecrpostgres:latest', ports: '', service: 'GPHD/ecr-postgresql', timeout: 60
                }
            }
        }
    }
}
