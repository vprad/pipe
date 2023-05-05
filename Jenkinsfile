pipeline {
    agent any
    environment {
        DOCKER_HUB_PASSWORD = "Venabi68*"
    }
    stages {
        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Testing the application"'
            }
        }
        stage('Dockerize') {
        steps {
        script {
            docker.withRegistry('https://docker.io', '5358b1bf-cb27-4a80-abaa-8e8b42b43db8') {
                def customImage = docker.build("pipeline-demo/my-app:latest", ".")
                customImage.push()
            }
        }
    }
}

    }
    post {
        always {
            sh 'docker logout https://docker.io'
        }
    }
}



