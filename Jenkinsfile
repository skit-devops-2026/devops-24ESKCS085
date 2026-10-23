pipeline {
    agent any

    environment {
        IMAGE = "ghcr.io/skit-devops-2026/devops-24eskcs085"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Verify Project Files') {
            steps {
                sh 'ls -la'
                sh 'test -f server.js && test -f Dockerfile && test -f docker-compose.yml'
            }
        }
        stage('Install') {
            steps {
                sh 'make install'
            }
        }
        stage('Test') {
            steps {
                sh 'make test'
            }
        }
        stage('Build Validation') {
            steps {
                sh 'make build'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build --build-arg COMMIT_SHA=${GIT_COMMIT} -t $IMAGE:latest .'
            }
        }
        stage('Docker Push') {
            when { branch 'main' }
            steps {
                withCredentials([usernamePassword(credentialsId: 'ghcr-credentials', usernameVariable: 'GH_USER', passwordVariable: 'GH_TOKEN')]) {
                    sh 'echo $GH_TOKEN | docker login ghcr.io -u $GH_USER --password-stdin'
                    sh 'docker push $IMAGE:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            when { branch 'main' }
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
    }

    post {
        always {
            echo 'interviewX pipeline finished.'
        }
    }
}
