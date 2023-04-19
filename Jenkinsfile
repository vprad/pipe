pipeline {
  agent any
  environment {
    APP_NAME = "demo"
    DOCKER_REGISTRY = "docker.io"
    DOCKER_REPO = "pradeepvenk99/pipeline-demo"
    DOCKER_IMAGE = "${DOCKER_REPO}:${BUILD_NUMBER}"
    DOCKER_USERNAME = "pradeepvenk99"
    DOCKER_PASSWORD = "Venabi68*"
    DOCKER_CREDENTIAL_ID = "5358b1bf-cb27-4a80-abaa-8e8b42b43db8" // replace with your credential ID
  }
  stages {
    stage("Build") {
      steps {
        sh "mvn clean package"
      }
    }
    stage('Login to Docker Hub') {      	
    steps{                       	
	  sh 'echo $DOCKER_PASSWORD | sudo docker login -u $DOCKER_USERNAME --password-stdin'                		
	  echo 'Login Completed'      
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


