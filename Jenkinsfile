pipeline{
    agent any
    stages{
        stage('Fetch The Code'){
            steps{
                git url:'https://github.com/PrashantSehrawat3/Django-Todo-app-DennisIVY.git' , branch:'main'
                echo "Code Fetched"
            }
        }
        
        stage('Build and Push The Code To DockerHub'){
            steps{
                sh 'docker build -t dennis-django-todo-through-jenkins-pipeline .'
                withCredentials([usernamePassword(credentialsId: "DockerHubCred", usernameVariable: "DockerHubUser", passwordVariable: "DockerHubPass")]){
                    sh "docker tag dennis-django-todo-through-jenkins-pipeline ${DockerHubUser}/dennis-django-todo-through-jenkins-pipeline:latest"
                    sh "docker login -u ${DockerHubUser} -p ${DockerHubPass}"
                    sh "docker push ${DockerHubUser}/dennis-django-todo-through-jenkins-pipeline:latest"
                }
            }
        }
        
        stage('Deploying The Code'){
            steps{
                sh 'docker-compose down'
                sh 'docker-compose up -d'
                //sh 'docker run -d --name dennis-django-todo-through-jenkins-pipeline -p 8001:8001 dennis-django-todo-through-jenkins-pipeline'
            }
        }
        
    }
}
