pipeline {
  agent any
  environment {
    APP_NAME = "demo"
    DOCKER_REGISTRY = "docker.io"
    DOCKER_REPO = "pradeepvenk99/pipeline-demo"
    DOCKER_IMAGE = "${DOCKER_REPO}:${BUILD_NUMBER}"
    DOCKER_USERNAME = credentials('pradeepvenk99')
    DOCKER_PASSWORD = credentials('Venabi68*')
  }
  stages {
    stage("Build") {
      steps {
        sh "mvn clean package"
      }
    }
    stage("Dockerize") {
      steps {
        script {
          docker.withRegistry("https://${DOCKER_REGISTRY}", "docker-hub") {
            def dockerImage = docker.build(DOCKER_IMAGE, ".")
            dockerImage.push()
          }
        }
      }
    }
  }
  post {
    always {
      script {
        docker.withRegistry("https://${DOCKER_REGISTRY}", "docker-hub") {
          docker.image(DOCKER_IMAGE).push()
        }
      }
    }
  }

}

