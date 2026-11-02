pipeline{
  agent any
  environment{
    Image_Name = "testdockerhub0123/JavaJenkins:1.0"
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
    stage('Docker Image Push'){
      steps{
        sh 'docker push $Image_Name'
      }
  }
}
