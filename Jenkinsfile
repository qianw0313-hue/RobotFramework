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
                bat 'robot checkout.robot'
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '*.html'
        }
    }
}