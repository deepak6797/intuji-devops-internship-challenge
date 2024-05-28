pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('Self-dockerhub')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/deepak6797/intuji-devops-internship-challenge.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t intuji/php:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push intuji/php:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
