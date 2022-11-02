pipeline {
    agent any
    environment {
        PROJECT_ID = 'swe645hw2'
        CLUSTER_NAME = 'swe645hw2'
        LOCATION = 'us-east-1a'
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        stage('BuildWAR') {
            steps {
            
            	dir('src/main/webapp') {
            		echo 'Creating the Jar ...'
					sh 'java -version'
					sh 'jar -cvf Assignment1_645.war *'
            	}
            }
        }
        
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("nileshbommisetty/645:${env.BUILD_ID}")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                	sh 'docker login -u NileshBommisetty -p Nilesh@123'
					myapp.push("${env.BUILD_ID}")
                }
            }
        }        
        stage("UpdateDeployment") {
			steps{
				sh 'kubectl config view'
				sh "kubectl get deployments"
				sh "kubectl set image deployment/assig2deplo container-0=nileshbommisetty/645:${env.BUILD_ID}"
			}
		}
    }    
}