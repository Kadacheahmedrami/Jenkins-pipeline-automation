pipeline {
    agent any

    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir() // Clean workspace
            }
        }

        stage('Pull Code from GitHub') {
            steps {
                git url: 'https://github.com/Kadacheahmedrami/Jenkins-pipeline-automation.git', branch: 'main'
            }
        }

        stage('Rebuild Containers') {
            steps {
                sh '''
                    cd /app
                    docker-compose down || true
                    docker-compose build
                    docker-compose up -d
                '''
            }
        }
    }
}
