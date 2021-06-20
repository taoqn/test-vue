pipeline {
  agent any
  tools {nodejs "latest"}
  stages {
    stage('preflight') {
      steps {
        echo sh(returnStdout: true, script: 'env')
        sh 'node -v'
      }
    }
    stage('install') {
      steps {
        sh 'npm --version'
        sh 'git log --reverse -1'
        sh 'npm install && npm audit fix'
      }
    }
    stage('test') {
      steps {
        sh 'npm test'
      }
    }
    stage('build') {
      steps {
        sh 'npm --version'
        sh 'git log --reverse -1'
        sh 'npm run build'
      }
    }
  }
}
