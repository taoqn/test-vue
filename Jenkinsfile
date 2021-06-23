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
      agent {
        docker {
            image 'node:14-alpine'
        }
      }
      steps {
        sh 'npm install'
        sh 'npm audit fix'
        sh 'npm i -g @vue/cli-service'
        sh 'npm i -g semver'
        sh 'npm run build'
      }
    }
    stage('Deploy') {
      when { tag "*" }
      steps {
          sh 'docker-compose up --build -d --remove-orphans'
      }
    }
  }
}
