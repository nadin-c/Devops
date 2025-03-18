pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-docker-image"
        TAG = "latest"
        CONTAINER_NAME = "my-container"
        PORT = "8080"
        DOCKER_HUB_USERNAME = "nadinc"    // Add Docker Hub username
        DOCKER_HUB_PASSWORD = "Nadin@2005"    // Add Docker Hub password
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning GitHub repository..."
                git 'https://github.com/nadin-c/Devops.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'chmod +x Build.sh'
                sh './Build.sh'
            }
        }

        // ✅ Add Docker Hub Push Stage
        stage('Push to Docker Hub') {
            steps {
                echo "Logging in to Docker Hub..."
                sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'

                echo "Tagging Docker image..."
                sh 'docker tag $IMAGE_NAME:$TAG $DOCKER_HUB_USERNAME/$IMAGE_NAME:$TAG'

                echo "Pushing Docker image to Docker Hub..."
                sh 'docker push $DOCKER_HUB_USERNAME/$IMAGE_NAME:$TAG'
            }
        }

        stage('Deploy Docker Container') {
            steps {
                echo "Deploying Docker container..."
                sh 'chmod +x Deploy.sh'
                sh './Deploy.sh'
            }
        }
    }

    post {
        success {
            echo "Deployment Successful!"
        }
        failure {
            echo "Deployment Failed!"
        }
    }
}
