pipeline{
  agent any
  environment{
    Image_Name = 'testdockerhub0123/javajenkins:1.0'
  }
  stages{
    stage('Compile'){
      steps{
        sh 'javac javahello.java'
      }
    }
    stage('Run'){
      steps{
        sh 'java javahello'
      }
    }
    stage('Docker Image Build'){
      steps{
        sh 'docker build -t $Image_Name .'
      }
    }
    stage('Docker Login'){
      steps{
        withCredentials([
          usernamePassword(
            credentialsId: 'my-docker-hub-credentials-id',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS' 
            )
        ]){
        sh '''
        echo '$DOCKER_PASS' | docker login -u '$DOCKER_USER' --password-stdin
        '''}
      }
    }
    stage('Docker Image Push'){
      steps{
        sh 'docker push $Image_Name'
      }
    }
  }
}
