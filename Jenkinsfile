pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t djahongir/jenkins-html-test .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Avval eski container bo‘lsa o‘chirib tashlaymiz
                    sh 'docker rm -f jenkins-html-container || true'
                    
                    // Yangi container yaratamiz
                    sh 'docker run -d -p 8000:80 --name jenkins-html-container djahongir/jenkins-html-test'
                }
            }
        }
    }

    post {
        success {
            echo "✅ Container ishga tushdi: http://<JENKINS_SERVER_IP>:8000"
        }
        failure {
            echo "❌ Xatolik yuz berdi"
        }
    }
}
