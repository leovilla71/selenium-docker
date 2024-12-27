pipeline {
    agent any
    stages{
        stage("build jar") {
            steps {
                echo    "======== executing build jar stage ========"
                bat      "mvn clean package -DskipTests"
            }
            post {
                success {
                    echo "======== build jar stage executed successfully ========"
                }
                failure {
                    echo "======== build jar stage execution failed ========"
                }
            }
        }
        stage("build docker image") {
            steps {
                echo    "======== executing build docker image stage ========"
                bat     "docker build -t=leovilla71/selenium-test:latest ."
            }
            post {
                success {
                    echo "======== build docker image stage executed successfully ========"
                }
                failure {
                    echo "======== build docker image stage execution failed ========"
                }
            }
        }
        stage("push image") {
            environment {
                DOCKER_HUB = credentials('dockerhub-user')
            }
            steps {
                echo    "======== executing push image stage ========"
                bat     'docker logout'
                bat     'echo %DOCKER_HUB_PSW% | docker login -u %DOCKER_HUB_USR% --password-stdin'
                bat     "docker push leovilla71/selenium-test:latest"
                bat     "docker tag leovilla71/selenium-test:latest leovilla71/selenium-test:${env.BUILD_NUMBER}"
                bat     "docker push leovilla71/selenium-test:${env.BUILD_NUMBER}"
            }
            post {
                success {
                    echo "======== push image stage executed successfully ========"
                }
                failure {
                    echo "======== push image stage execution failed ========"
                }
            }
        }
    }
    post {
        always {
            echo "======== login out docker account ========"
            bat  "docker logout"
        }
        success {
            echo "======== pipeline executed successfully ========"
        }
        failure {
            echo "======== pipeline execution failed ========"
        }
        aborted {
            echo "======== pipeline execution aborted ========"
        }
    }
}