pipeline{
   agent any
   
   stages{
     stage('Compile Stage'){
     
     steps {
          withMaven(maven: 'Aman Gauri'){
              sh 'mvn clean compile'   
          }
       }
     }
     
       stage('Testing Stage'){
        steps {
          withMaven(maven: 'Aman Gauri'){
              sh 'mvn test'   
          }
       } 
     }
     stage('Deployment Stage'){
        steps {
          withMaven(maven: 'Aman Gauri'){
              sh 'mvn deploy'   
          }
       } 
     }
   }
}