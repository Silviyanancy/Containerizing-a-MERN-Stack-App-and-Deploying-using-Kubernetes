# MERN_App


## Step 1: Initial Setup
sudo apt update && sudo apt upgrade -y

sudo apt install -y curl git build-essential

sudo apt install -y nodejs npm

node -v

npm -v

sudo apt install -y python3 python3-pip

## Step 2: Backend Setup (Python with Flask)
mkdir backend

cd backend

pip install Flask pymongo

pip install flask-cors

Create a file named app.py

## Step 3: Frontend Setup
Users.js

App.js

## Step 4: Install MongoDB on Linux
Add the MongoDB Repository - Import the public GPG key

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

Create a list file for MongoDB

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb

sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb

sudo apt --fix-broken install

sudo apt install -y mongodb-org

Add the MongoDB Shell Repository
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

sudo apt install -y mongodb-mongosh

mongosh

show dbs

use personal_details

db.users.find().pretty()

Details are added to the database

## Step 5: Dockerization

Dockerfile for frontend, backend, docker-compose file

docker-compose up --build # builds the images and runs the containers

docker ps -a #Shows the running container

Test the application:
Frontend: http://localhost:3000
Backend: http://localhost:5000/users

## Step 6: Push the images to dockerhub

Create a file push_to_dockerhub.sh

### To make the script executable
chmod +x push_to_dockerhub.sh

./push_to_dockerhub.sh

## Step 7: Jenkins Integration
sudo apt install openjdk-17-jdk -y

##### Find the Java 17 installation path
sudo update-alternatives --config java

###### Set the JAVA_HOME variable for Jenkins
sudo nano /etc/default/jenkins

JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

Add Jenkins Repository

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

Install Jenkins

sudo apt update

sudo apt install jenkins -y

sudo systemctl start jenkins

sudo systemctl enable jenkins

Get password

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

http://localhost:8080

Add Jenkins User to the Docker Group

sudo usermod -aG docker jenkins

To restart jenkins

sudo systemctl restart jenkins

Make changes to docker-compose when automating using jenkins pipeline,
Use Docker-managed volumes and unique ports to avoid conflicts in multi-user or shared environments like Jenkins.


## Step 8: Set Up a GitHub Webhook

Go to Manage Jenkins > Manage Plugins >> GitHub Integration Plugin (install).

Configure Your Jenkins Pipeline Job -> Configure -> Build Trigger -> click -> GitHub hook trigger for GITScm polling.

###### Set Up a Webhook in GitHub

Project -> settings -> Add Webhook

Payload URL: http://<your-jenkins-server>/github-webhook/
Replace <your-jenkins-server> with your Jenkins server’s URL.
Content type: application/json.
Events: Select Just the push event.

##### Use ngrok to Expose Jenkins Locally

Install ngrok 

curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok

Create ngrok account to get token and login

Obtain Your AuthToken

Configure ngrok with the AuthToken -> ngrok config add-authtoken <your-authtoken>

Start ngrok  ->ngrok http 8080

Update WebHook -> Add the public URL as payload in github (check github)

This line is to check if the pipeline is triggered automatically after adding webhook - Yes the pipeline was triggered automatically.

## Step 9: Setting up kubernetes cluster locally

Install Minikube

sudo apt update

sudo apt install -y curl

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube

###### Start Minikube

minikube start

kubectl get nodes #Verify if its running

####### Write Kubernetes Manifests
Deployment: For backend, frontend, and MongoDB.

Service: To expose the frontend and backend.

Persistent Volume: For MongoDB data.

######## Apply the Manifests

kubectl apply -f backend-deployment.yml

kubectl apply -f frontend-deployment.yml

kubectl apply -f mongodb-deployment.yml

kubectl apply -f backend-service.yml

kubectl apply -f frontend-service.yml

Verify all resources are running::: kubectl get all


####### Access the Application

Find the NodePort for the frontend-service:---> kubectl get svc frontend-service

Access the frontend in your browser: Use http://<Node IP>:<NodePort>

Get node IP ---> minikube ip

kubectl get pods

kubectl get deployments

###### Directory and File Setup for kubeconfig -  Kubernetes setup process and their explanations to help you understand what each command accomplished:

1. Create the .kube Directory for Jenkins

sudo mkdir -p /var/lib/jenkins/.kube   #Purpose: Create a directory to store the Kubernetes configuration file (config) for the jenkins user.

2. Copy the kubeconfig File

sudo cp ~/.kube/config /var/lib/jenkins/.kube/config # Purpose: Copy the kubeconfig file (stored in nancy's home directory) to the directory accessible by the jenkins user.

3. Set Permissions for the kubeconfig File

sudo chown -R jenkins:jenkins /var/lib/jenkins/.kube

sudo chmod 600 /var/lib/jenkins/.kube/config  #Purpose: Ensure the jenkins user owns the kubeconfig file and restrict access to only the owner for security.


####### Adjust Permissions for Minikube Certificates

4. Check Directory Permissions # Purpose: Verify that the parent directories of the Minikube certificates allow sufficient access for the jenkins user.


ls -ld /home/nancy

ls -ld /home/nancy/.minikube

ls -ld /home/nancy/.minikube/profiles

5. Grant Execute Permission on Parent Directories #Purpose: Allow the jenkins user to traverse (+x) the directories leading to the Minikube certificate files.

sudo chmod +x /home/nancy

sudo chmod -R +X /home/nancy/.minikube

6. Verify Access to Minikube Certificates #Purpose: Check if the jenkins user can now access the certificate files required for Kubernetes.

sudo -u jenkins ls /home/nancy/.minikube/profiles/minikube

####### Test Kubernetes Access
7. Switch to the jenkins User - #Purpose: Log in as the jenkins user to ensure all commands are executed in the context of Jenkins.

sudo su - jenkins

######## 8. Verify Kubernetes Connectivity - #Purpose: Confirm that the jenkins user can successfully connect to the Kubernetes cluster and list the nodes.

kubectl get nodes


## Step 10. Test the application



