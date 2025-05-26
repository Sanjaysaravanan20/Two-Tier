pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID = credentials('aws-creds')
    AWS_SECRET_ACCESS_KEY = credentials('aws-creds')
  }

  stages {
    stage('Checkout Code') {
      steps {
        git 'https://github.com/Sanjaysaravanan20/Two-Tier.git'
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
        sh 'terraform plan -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      steps {
        input "Approve apply?"
        sh 'terraform apply -auto-approve tfplan'
      }
    }
  }
}
