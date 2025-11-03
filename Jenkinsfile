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
                    sh 'docker rm -f jenkins-html-container || true'
                    sh 'docker run -d -p 8000:80 --name jenkins-html-container djahongir/jenkins-html-test'
                }
            }
        }

        stage('Push Image to DockerHub') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'hello', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh '''
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            docker push djahongir/jenkins-html-test
                        '''
                    }
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
