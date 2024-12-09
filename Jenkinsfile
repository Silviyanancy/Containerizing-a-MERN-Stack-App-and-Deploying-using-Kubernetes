pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub')
        DOCKER_HUB_USERNAME = "nancysilviya"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Silviyanancy/MERN_App.git'
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    sh 'docker-compose build'
                }
            }
        }

        stage('Push Docker Images to Docker Hub') {
            steps {
                script {
                    sh """
                        echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_USERNAME --password-stdin
                        docker tag mern_app-backend:latest $DOCKER_HUB_USERNAME/mern_app-backend:latest
                        docker tag mern_app-frontend:latest $DOCKER_HUB_USERNAME/mern_app-frontend:latest
                        docker push $DOCKER_HUB_USERNAME/mern_app-backend:latest
                        docker push $DOCKER_HUB_USERNAME/mern_app-frontend:latest
                    """
                }
            }
        }

        stage('Deploy Application') {
            steps {
                script {
                    sh 'docker-compose down && docker-compose up -d'
                }
            }
        }
    }
}
