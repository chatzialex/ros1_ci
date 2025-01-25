pipeline {
  agent any
  environment {
    IMAGE_NAME = 'chatzialex/ros1_ci:latest'
    CONTAINER_NAME = 'ros1_ci_1'
  }
  parameters {
    booleanParam(name: 'HEADLESS', defaultValue: false, description: 'Run tests in headless mode')
  }
  stages {
    stage('Build') {
      steps {
        script {
          sh "docker build --no-cache -t ${IMAGE_NAME} ."
        }
      }
    }
    stage('Test') {
      steps {
        sh """
          docker container rm ${CONTAINER_NAME} -f || true
          docker run --name ${CONTAINER_NAME} --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority -e DISPLAY=$DISPLAY ${IMAGE_NAME} rostest tortoisebot_waypoints waypoints_test.test headless:=${params.HEADLESS}
        """
      }
    }
  }
  post {
    always {
      script {
        sh "docker container rm ${CONTAINER_NAME} -f || true"
      }
    }
  }
}

