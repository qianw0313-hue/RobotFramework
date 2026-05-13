pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/qianw0313-hue/RobotFramework.git'
            }
        }

        stage('Install') {
            steps {
                bat 'pip install robotframework'
                bat 'pip install robotframework-seleniumlibrary'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'python -m robot --listener allure_robotframework tests/checkout.robot'
            }
        }
    }

    post {
        always {
        allure includeProperties: false,
               jdk: '',
               results: [[path: 'allure-results']]
        }
    }
}