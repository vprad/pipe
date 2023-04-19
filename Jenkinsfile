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
                    withDockerRegistry([credentialsId: '5358b1bf-cb27-4a80-abaa-8e8b42b43db8', url: 'https://hub.docker.com']) {
                        sh 'docker login -u pradeepvenk99 -p $DOCKER_HUB_PASSWORD https://docker.io'
                        sh 'docker tag my-app:latest pradeepvenk99/pipeline-demo:35'
                        sh 'docker push pradeepvenk99/pipeline-demo:35'
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



