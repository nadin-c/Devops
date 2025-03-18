pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-docker-image"
        TAG = "latest"
        CONTAINER_NAME = "my-container"
        PORT = "8080"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning GitHub repository..."
                git 'https://github.com/nadin-c/Devops.git'  // Replace with your repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'chmod +x Build.sh'
                sh './Build.sh'
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
