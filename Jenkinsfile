pipeline {
  agent { label 'Jenkins-slave' } // Jenkins slave label name

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret')
    GITHUB_TOKEN          = credentials('Github-Token')
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/Loki-677/Terraform-project.git', branch: env.CHANGE_BRANCH ?: 'main'
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
}