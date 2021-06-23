pipeline {
  agent any
  environment { 
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
        sh 'docker build -t mcare-web-portal --build-arg TAG_NAME .'
      }
    }
    stage('Deploy') {
      when { tag "*" }
      steps {
          sh 'docker run --name mcare-web-portal --rm --detach -d -p 3111:3000 mcare-web-portal'
      }
    }
  }
}
