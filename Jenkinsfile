
node {
    stage ('checkout') {
        checkout scm 
    }
    
    stage ('Go build') {
      withEnv(['GOBIN=/usr/local/go']){
        docker.withTool('docker-latest') {
          // WTF. I need to add -u root in order to overwrite 1000:1000 ?!
          docker.image('golang:latest').inside('-u root') {
            sh "/usr/local/go/bin/go version"
            sh "/usr/local/go/bin/go get ./..."
            sh 'CGO_ENABLED=0 /usr/local/go/bin/go build -a --installsuffix cgo --ldflags="-s" -o whoamI'
          }
        }
      }
    }
    
    stage ('Docker build') {
      docker.withTool('docker-latest') {
        dockerImage = docker.build("whoami:${env.BUILD_NUMBER}")
      }
    }
}
