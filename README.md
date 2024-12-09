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
