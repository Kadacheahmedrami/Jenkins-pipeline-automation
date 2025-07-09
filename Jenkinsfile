pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Kadacheahmedrami/Jenkins-pipeline-automation.git', branch: 'main'
            }
        }

        stage('Build & Deploy') {
            steps {
                sh '''
                    docker compose down
                    docker compose build
                    docker compose up -d
                '''
            }
        }
    }
}
