pipeline{
    agent any
    stages{
        stage("build jar"){
            steps{
                echo    "======== executing build jar stage ========"
                bat      "mvn clean package -DskipTests"
            }
            post{
                success{
                    echo "======== build jar stage executed successfully ========"
                }
                failure{
                    echo "======== build jar stage execution failed ========"
                }
            }
        }
        stage("build docker image"){
            steps{
                echo    "======== executing build docker image stage ========"
                bat     "docker build -t=leovilla71/selenium-test ."
            }
            post{
                success{
                    echo "======== build docker image stage executed successfully ========"
                }
                failure{
                    echo "======== build docker image stage execution failed ========"
                }
            }
        }
        stage("push image"){
            steps{
                echo    "======== executing push image stage ========"
                bat     "docker push leovilla71/selenium-test"
            }
            post{
                success{
                    echo "======== push image stage executed successfully ========"
                }
                failure{
                    echo "======== push image stage execution failed ========"
                }
            }
        }
    }
    post{
        success{
            echo "======== pipeline executed successfully ========"
        }
        failure{
            echo "======== pipeline execution failed ========"
        }
        aborted{
            echo "======== pipeline execution aborted ========"
        }
    }
}