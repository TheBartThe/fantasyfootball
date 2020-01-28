pipeline{
        agent any
        
        stages{ 
                stage('---Update Images---'){
                        steps{
                                sh '''cd ~/fantasyfootball
					git pull
					docker-compose build
					docker-compose push
					docker-compose down
					docker container prune -f
					docker system prune -af
					kubectl apply -f kube-app.yaml
                                      '''
                        }
                }
	}
}
