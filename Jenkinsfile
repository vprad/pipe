pipeline {
    agent any
    stages {
//         stage("Maven Build") {
//             agent {
//                 docker { image 'maven:3.6.3-jdk-11' }
//             }
//             steps {
//                 sh "mvn clean install"
//             }
//         }
//         stage("Maven Test") {
//             agent {
//                 docker { image 'maven:3.6.3-jdk-8' }
//             }
//             steps {
//                 sh "mvn test"
//             }
//         }
        // stage("Docker Check"){
        //     agent any
        //     steps{
        //         sh "conftest test --policy dockerfile-security.rego  Dockerfile"
        //     }
        // }
        stage("Docker Build") {
            agent any
            steps {
                sh "docker build -t pradeepvenk99/pipeline-demo:latest ."
            }
        }
        stage("Dockerhub Push") {
            agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-login', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "docker login -u pradeepvenk99 -p Venabi68*"
                    sh "docker push pradeepvenk99/pipeline-demo:latest"
                }
            }
        }
        // stage("Nexus Push"){
        //     agent any
        //     steps{
        //         sh "docker tag saimanas123/spring-petclinic nexus-1416675214.us-east-1.elb.amazonaws.com:9090/docker-images/spring-petclinic-${BUILD_NUMBER}"
        //         sh "docker login -u admin -p admin nexus-1416675214.us-east-1.elb.amazonaws.com:9090"
        //         sh "docker push nexus-1416675214.us-east-1.elb.amazonaws.com:9090/docker-images/spring-petclinic-${BUILD_NUMBER}"
        //     }
        // }
        // stage("ECR Push"){
        //     agent any
        //     steps{
        //         withCredentials([string(credentialsId: 'aws-ecr', variable: 'AWS_REGISTRY')]) {
        //             sh "docker login -u AWS -p \$(aws ecr get-login-password --region us-east-1) $AWS_REGISTRY"
        //             sh "docker tag saimanas123/spring-petclinic $AWS_REGISTRY:testrepo:spring-petclinic-${BUILD_NUMBER}"
        //             sh "docker push $AWS_REGISTRY:testrepo:spring-petclinic-${BUILD_NUMBER}"
        //         }
        //     }
        // }      
        stage('Build on k8 ') {
            steps {             
                sh 'cd'
                sh '/usr/local/bin/helm upgrade --install petclinic-app petclinic  --set image.repository=saimanas123/spring-petclinic --set image.tag=latest  --kubeconfig ~/.kube/config'
            }            
        }
    }
}
