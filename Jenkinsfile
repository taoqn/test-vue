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
        sh 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash'
        sh 'nvm install v14.15.5'
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
