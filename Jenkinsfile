pipeline{
  agent any
  environment{
    Image_Name = 'testdockerhub0123/javajenkins:1.0'
    Job_Name = 'pipeline'
  }
  stages{
    stage('Compile'){
      steps{
        sh 'javac javahello.java'
      }
    }
    stage('Run Program'){
      steps{
        sh 'java javahello'
      }
    }
    stage('Docker Image Build'){
      steps{
        sh 'docker build -t $Image_Name .'
      }
    }
    stage('Docker Image Run'){
      steps{
        sh 'docker run --rm $Image_Name'
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
        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
        '''}
      }
    }
    stage('Docker Image Push'){
      steps{
        sh 'docker push $Image_Name'
      }
    }
    stage('Creating Kubernetes Pod'){
      steps{
        sh 'kubectl apply -f development.yaml'
        sh 'kubectl logs job/"$Job_Name"'
      }
    }
  }
}
