# DevOps CI/CD Pipeline with Kubernetes (Diploma Project)

## Project Description

This project demonstrates a complete DevOps pipeline including:

- Infrastructure in Yandex Cloud
- Kubernetes cluster (Managed Service)
- CI/CD pipeline via GitHub Actions
- Docker containerization
- Automated deployments
- Monitoring with Grafana

---

## Architecture

## flowchart LR
    GitHub --> GitHubActions
    GitHubActions --> DockerBuild
    DockerBuild --> YandexCR
    YandexCR --> Kubernetes
    Kubernetes --> App
    Kubernetes --> Grafana

## Kubernetes Cluster

Managed Kubernetes cluster in Yandex Cloud.

Deployment: test-app
Replicas: 2
Strategy: RollingUpdate
Service type: NodePort
Application Access
http://89.169.152.54:30796

CI/CD Pipeline
Implemented using GitHub Actions.
Workflow steps:


Checkout code
Build Docker image
Push image to Yandex Container Registry
Update Kubernetes deployment

# Trigger:
Push to main branch



Container Registry
Docker images are stored in:
cr.yandex/crpnq3ci2q59h2s03lt7/test-app

# Monitoring
Grafana deployed via Helm.

Service type: NodePort

Port: 31000


Access

Application:
http://89.169.152.54:30796

Grafana:
http://89.169.152.54:31000

Login:
admin / admin

# Secrets Used

YC_KEY – Yandex Cloud service account key


# Deployment Strategy
Rolling updates enabled
Zero-downtime deployment via Kubernetes

# Summary
This project demonstrates:
Cloud-native architecture
CI/CD automation
Kubernetes orchestration
Observability setup
