pipeline {
  agent any
  environment {
    APP_NAME = "demo"
    DOCKER_REGISTRY = "docker.io"
    DOCKER_REPO = "pradeepvenk99/pipeline-demo"
    DOCKER_IMAGE = "${DOCKER_REPO}:${BUILD_NUMBER}"
    DOCKER_USERNAME = "pradeepvenk99"
    DOCKER_PASSWORD = "Venabi68\\*"
    DOCKER_CREDENTIAL_ID = "'69b95eac-e366-419a-9144-e72482a50b99'" // replace with your credential ID
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
          docker.withRegistry("https://${DOCKER_REGISTRY}", DOCKER_CREDENTIAL_ID) {
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
        docker.withRegistry("https://${DOCKER_REGISTRY}", DOCKER_CREDENTIAL_ID) {
          docker.image(DOCKER_IMAGE).push()
        }
      }
    }
  }
}


