pipeline {
<<<<<<< HEAD
    agent { lebel "Jenkins-slave"} #jenkins slave lable name

    environments{
        AWS_Access_Key_ID = credentials('aws_access')
        AWS_Secret_Access_Key = credentials('aws-secret')
        Github_tocken = credentials('github-token')
    }

    triggers{
        githubPullRequest() #for github pull request
    }
    stage {
        stage("checkout") {
            steps {
                github url 'https://github.com/Loki-677/Terraform-project.git', branch: "${env.CHANGE_BRANCH ?: 'main'}"
            }
        }

        stage ("Terraform Init"){
                steps{
                    sh "terraform init" 
                    }
                }
        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
                }
            }
        
        stage ("Terraform Plan"){
            steps{
                sh "terraform plan -input=false" 
            }
        }
        stage ("Terraform Apply"){
            when {
        branch 'main'  // Only apply on main branch merges
            }

            steps{
                sh "terraform apply -auto-approve" 
            }
        }

    }
=======
  agent { label 'Jenkins-slave' } // Jenkins slave label name

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret')
    GITHUB_TOKEN          = credentials('Github-Token')
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/Loki-677/Terraform-project.git', branch: env.CHANGE_BRANCH ?: 'feature-1'
      }
    }
    stage('Terraform Init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('Terraform Validate') {
      steps {
        sh 'terraform validate'
      }
    }
    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -var-file=terraform.tfvars'
      }
    }
    stage('Terraform Apply') {
      when {
        branch 'main' // Only apply on main branch merges
      }
      steps {
        sh 'terraform apply -auto-approve'
      }
    }
  }
>>>>>>> feature-1
}