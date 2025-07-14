pipeline {
    agent any

    environment {
        DOCKER_HOST = "unix:///var/run/docker.sock"
    }

    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir()
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
                    echo "🛑 Force-removing only known containers (excluding Jenkins)..."
                    docker rm -f mysql_db wordpress_app phpmyadmin_ui nginx_gateway || true

                    echo "🧹 Bringing down only Compose-managed containers..."
                    docker-compose down || true

                    echo "🔨 Rebuilding containers..."
                    docker-compose build

                    echo "🚀 Starting containers..."
                    docker-compose up -d
                '''
            }
        }
    }
}
