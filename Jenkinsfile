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
        docker.withRegistry('https://docker.io', 'docker-credentials') {
        def customImage = docker.build('my-app:latest', '.')
        customImage.tag("pradeepvenk99/pipeline-demo:late")
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



