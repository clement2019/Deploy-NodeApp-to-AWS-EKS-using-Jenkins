pipeline {
  agent any
  
  tools {nodejs "node"}
  environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        WS_DEFAULT_REGION = "eu-west-2"
    }
    
  stages {
    stage("GitHub git cloning") {
            steps {
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'GITHUB_CREDENTIALS', url: 'https://github.com/clement2019/Deploy-NodeApp-to-AWS-EKS-using-Jenkins.git']])
                    //git branch: 'main', url: 'https://github.com/clement2019/Deploy-NodeAp-AWS-EKS-jenkins.git' 
                }
            }
        }
     
    stage('intialising npm installation.......') {
      steps {
        sh 'npm install'
  
       
      }
    }
  
     stage('Docker image building......') {
            steps {
                script {
                 
                  sh 'printenv'
                  sh 'git version'
                  //sh 'docker build -t good777lord/node-app:""$Build_ID"".'
                  sh 'docker build -t good777lord/node-app7.0 .'
                }
            }
        }


        stage('pushing Docker Image to DockerHub') {
            steps {
                script {
                  
                 withCredentials([string(credentialsId: 'DOCKERID', variable: 'DOCKERID')]) {
                    sh 'docker login -u good777lord -p ${DOCKERID}'
            }
            //normally
            //sh 'docker push good777lord/node-app:""$Build_ID""'
            sh 'docker push good777lord/node-app7.0:latest'
        }
            }   
        }
         
     
       

  }
}
