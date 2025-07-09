pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/your-local-repo.git', branch: 'main'
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
