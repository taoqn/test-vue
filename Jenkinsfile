pipeline {
  agent any
  environment { 
    BUILD_TARGET = 'true'
    NODE_ENV = 'production'
    PORT = '3000'
  }
  stages {
    stage('preflight') {
      steps {
        echo sh(returnStdout: true, script: 'env')
      }
    }
    stage('build') {
      steps {
        sh 'docker build -t myjenkins-blueocean .'
      }
    }
    stage('Deploy') {
      when { tag "*" }
      steps {
          sh 'docker run --name jenkins-blueoce --rm --detach -d -p 3000:3000 myjenkins-blueocean'
      }
    }
  }
}
