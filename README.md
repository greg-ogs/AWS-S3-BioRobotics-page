# Flask Application in Docker & Kubernetes

This project demonstrates a simple Flask web application running inside a Docker container and deployed to Kubernetes.

## Features

* **Dockerized Application:** Easy deployment and portability using Docker.
* **Kubernetes Deployment:** Includes Kubernetes deployment and service configuration.
* **Ingress for External Access:** Exposes the application externally using an Ingress.
* **Health Checks:**  `/healthz` and `/healthx` endpoints for monitoring.

## Getting Started

### Prerequisites

* **Docker:** Installed and running.
* **Kubernetes Cluster:** Minikube or a cloud-based cluster.
* **Kubectl:** Configured to connect to your cluster.

### Local Development (with Docker)

1. **Clone:** `git clone <repository-url>`
2. **Navigate:** `cd <project-directory>`
3. **Build Image:** `docker build -t flask-app .`
4. **Run Container:** `docker run -p 5000:5000 flask-app`
5. **Access:** `http://localhost:5000`

### Kubernetes Deployment

1. **Apply Deployment, service & Ingress:** `kubectl apply -f Manifest.yml`

   After applying the Ingress, obtain the external IP or hostname of your Ingress controller. This might take a few minutes.  You can usually find it by running `kubectl get ingress`.
2**Access Application:** Access the app through the external IP or hostname. The following paths are available:

    * **Homepage:**  `http://k8s.testing.com/`
    * **Flask page:** `http://k8s.testing.com/flask`
    * **Docker page:** `http://k8s.testing.com/docker`



## Application Structure

* `/app`: Contains the Flask application code.
* `/app/templates`: HTML templates.
* `Dockerfile`: Docker build instructions.
* `Manifest.yml`: K8s manifest.
* `requirements.txt`: Python dependencies.