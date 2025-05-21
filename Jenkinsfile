pipeline {
    agent any
 
    environment {
        IMAGE_NAME = "sreejavoma/my-python-app"
        TAG = "latest"
    }
 
    stages {
        stage('List Files') {
            steps {
                sh 'ls -la'
            }
        }
 
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME:$TAG ."
                }
            }
        }
 
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh """
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            docker push $IMAGE_NAME:$TAG
                        """
                    }
                }
            }
        }
    }
 
    post {
        always {
            sh 'docker logout'
        }
    }
}