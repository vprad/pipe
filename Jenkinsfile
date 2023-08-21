pipeline {
    agent any
    environment {
        DOCKER_HUB_PASSWORD = "Venabi68*"
    }
    tools {
        // Configure the Maven tool with the name "M3"
        maven 'M3'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Use the withEnv step to temporarily set the environment for Maven
                    withEnv(["PATH+MAVEN=${tool name: 'M3', type: 'hudson.tasks.Maven$MavenInstallation'}/bin"]) {
                        sh "mvn clean package"
                    }
                }
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
                    docker.withRegistry('https://docker.io', 'DOCKER_HUB_PASSWORD') {
                        sh "docker login --username=pradeepvenk99 --password=Venabi68*"
                        def customImage = docker.build("pradeepvenk99/pipeline-demo:late", ".")
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




