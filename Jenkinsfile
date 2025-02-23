pipeline{
    agent {
        label "Build"
    }
    stages{
        stage("Install Docker") {
            steps {
                sh '''
                sudo yum install docker
                sudo systemctl enable --now docker
                '''
            }
        }
        stage("Clone the git repository") {
            steps {
                sh '''
                sudo git clone https://github.com/soumyabiswas37/jenkins_project3.git
                sudo docker build -t mycontainer:v$BUILD_NUMBER .
                sudo docker images
                '''
            }
        }
        stage("Approval") {
            steps {
                input message: "Proceed to create container?", ok: 'Yes'
            }
        }
        stage("Creating the container"){
            steps {
                sh '''
                sudo docker run -d --name MYCONTAINER_$BUILD_NUMBER -p 30$BUILD_NUMBER:3000 mycontainer:v$BUILD_NUMBER
                sudo docker ps -a
                '''
            }
        }
        stage("Cleaning workspace") {
            steps {
                sh "echo 'Cleaning Workspace'"
                cleanWs()
            }
        }
    }
}
