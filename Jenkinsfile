pipeline {
    agent any

    environment {
        VENV = 'venv'
        DOCKER_IMAGE = 'sreejavoma/my-python-app'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage("Install") {
            steps {
                sh '''
                    python3 -m venv $VENV
                    . $VENV/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage("Linting") {
            steps {
                echo "This is my Linting Step"
            }
        }

        stage("Install Packages") {
            steps {
                echo "This is Install Packages Step"
            }
        }

        stage("Run Application") {
            steps {
                echo "This is my Run application Step"
            }
        }

        stage("Build Docker Image") {
            steps {
                sh '''
                    docker build -t $DOCKER_IMAGE:$DOCKER_TAG .
                '''
            }
        }

        stage("Push to Docker Hub") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $DOCKER_IMAGE:$DOCKER_TAG
                        docker logout
                    '''
                }
            }
        }
    }
}