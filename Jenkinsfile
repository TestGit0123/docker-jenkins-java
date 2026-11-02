pipeline{
  agent any
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
  }
}
