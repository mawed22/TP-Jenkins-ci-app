pipeline {
  agent any
  environment {
    CONTAINER_NAME = "myapp-container"
    DOCKER_IMAGE = "${env.DOCKER_IMAGE }"
    EC2_IP = "${env.EC2_IP}"
  }
  stages {
    stage('Cloner') {
      steps {
        git branch: 'main', url: 'https://github.com/mawed22/TP-Jenkins-ci-app.git'
      }
    }
    stage('Build') {
      steps {
        sh 'sudo docker build -t $DOCKER_IMAGE .'
      }
    }
    stage('Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
          sh 'sudo echo $PASS | sudo docker login -u $USER --password-stdin'
          sh 'sudo docker push $DOCKER_IMAGE'
        }
      }
    }
    stage('Deploy') {
      steps {
        sshagent(['ec2-key']) {
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@$EC2_IP "docker pull $DOCKER_IMAGE"'
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@$EC2_IP "docker rm -f "$CONTAINER_NAME" 2>/dev/null || true"'
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@$EC2_IP "docker run -d --name $CONTAINER_NAME -p 80:80 $DOCKER_IMAGE"'
        }
      }
    }
  }
}