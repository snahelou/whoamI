
node {
    stage ('checkout') {
        checkout scm 
    }
    
    stage ('Go build') {
        docker.withTool('docker-latest').image('golang:alpine').inside('-v /data:/data') {
            sh "go version"
        }
    }
}
