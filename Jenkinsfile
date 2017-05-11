
node {
    stage ('checkout') {
        checkout scm 
    }
    
    stage ('Go build') {
        docker.image('golang:alpine').inside('-v /data:/data') {
            sh "go version"
        }
    }
}
