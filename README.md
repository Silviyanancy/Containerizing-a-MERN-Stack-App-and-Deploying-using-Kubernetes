# Containerizing a MERN Stack App and Deploying using Kubernetes

This project is a **MERN (MongoDB, Express, React, Node.js)** full-stack application enhanced with modern DevOps practices. It includes **Docker containerization**, **Jenkins CI/CD pipeline**, and **Kubernetes** for deployment and scaling.

---

## Tech Stack

- **Frontend**: React.js
- **Backend**: Node.js + Express.js
- **Database**: MongoDB
- **DevOps**:
  - Docker & Docker Compose
  - Jenkins (CI/CD)
  - Kubernetes (Minikube)
  - Prometheus + Grafana (Monitoring)
  - Ngrok (for GitHub Webhooks)

---

## Features

- User-friendly MERN application
- Containerized frontend, backend, and database
- Automated build/test/push pipeline with Jenkins
- GitHub Webhook integration for CI/CD
- Kubernetes deployment using `kubectl`
- Monitoring with Prometheus and Grafana

---

## CI/CD Pipeline (Jenkins)

1. **Clone Repo** from GitHub
2. **Build Docker Images** (frontend, backend)
3. **Push to DockerHub**
4. **Deploy to Kubernetes**
5. **Monitoring setup (optional)**

Trigger: Automatically via GitHub Webhooks using Ngrok

---

## Getting Started (Dev)

```bash
# Clone repository
git clone https://github.com/your-username/MERN_App.git
cd MERN_App

# Build and start services
docker-compose up --build
```

## Deploying to Kubernetes

```bash
kubectl apply -f k8s/
kubectl get pods
```

## Monitoring
- Prometheus scrapes metrics from the app
- Grafana dashboards for visualizing performance

## Learnings
- CI/CD automation with Jenkins
- Docker usage
- Kubernetes basics: pods, services, deployments
- System monitoring & observability
