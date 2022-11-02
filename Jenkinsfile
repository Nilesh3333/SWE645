pipeline {
    agent any
    tools {
        maven '3.8.6'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Nilesh3333/SWE645']]])
                sh 'mvn clean install'
            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    docker.build("nileshbommisetty/645:${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Push Image To Hub'){
            steps{
                script{
                    sh "docker login -u NileshBommisetty -p Nilesh@123"
                    sh "docker push nileshbommisetty/645:${env.BUILD_NUMBER}"
				}
			}
		}
		stage("Deploying to Kubernetes"){
			steps{
				script{
					sh "kubectl set image deployment/assig2deplo container-0=nileshbommisetty/645:${env.BUILD_NUMBER}"
				}
			}
		}
	}
}