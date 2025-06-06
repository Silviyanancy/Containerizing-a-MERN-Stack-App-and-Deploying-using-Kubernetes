// Before Kubernetes
/*pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = "nancysilviya" // Your Docker Hub username
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

        stage('Tag and Push Docker Images') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                    script {
                        sh '''
                            echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin
                            docker tag mern_app-backend:latest $DOCKER_HUB_USERNAME/mern_app-backend:latest
                            docker tag mern_app-frontend:latest $DOCKER_HUB_USERNAME/mern_app-frontend:latest
                            docker push $DOCKER_HUB_USERNAME/mern_app-backend:latest
                            docker push $DOCKER_HUB_USERNAME/mern_app-frontend:latest
                        '''
                    }
                }
            }
        }

        stage('Deploy Application') {
            steps {
                script {
                    sh '''
                        docker-compose down
                        docker-compose up -d
                    '''
                }
            }
        }
    }
}*/


// Adding kuberenetes
pipeline {
    agent any

    environment {
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

        stage('Tag and Push Docker Images') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                    script {
                        sh '''
                            echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin
                            docker tag mern_app-backend:latest $DOCKER_HUB_USERNAME/mern_app-backend:latest
                            docker tag mern_app-frontend:latest $DOCKER_HUB_USERNAME/mern_app-frontend:latest
                            docker push $DOCKER_HUB_USERNAME/mern_app-backend:latest
                            docker push $DOCKER_HUB_USERNAME/mern_app-frontend:latest
                        '''
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh '''
                        kubectl apply -f backend-deployment.yml
                        kubectl apply -f frontend-deployment.yml
                        kubectl apply -f mongodb-deployment.yml
                        kubectl apply -f backend-service.yml
                        kubectl apply -f frontend-service.yml
                    '''
                }
            }
        }
    }
}
