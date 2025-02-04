# Flask Application in Docker & Kubernetes

This project demonstrates a simple Flask web application running inside a Docker container and deployed to Kubernetes.

## Features

* Dockerized Flask application for easy deployment and portability.
* Kubernetes deployment configuration included.
* Health check endpoints for robust monitoring.


## Getting Started

### Prerequisites

* Docker: Ensure Docker is installed and running.
* Kubernetes:  A Kubernetes cluster is required for deployment.  Minikube or a cloud-based cluster will work.
* Kubectl:  The Kubernetes command-line tool, `kubectl`, should be configured to interact with your cluster.


### Building and Running with Docker

1. Clone the repository: `git clone <repository-url>`
2. Navigate to the project directory: `cd <project-directory>`
3. Build the Docker image: `docker build -t flask-app .`
4. Run the Docker container: `docker run -p 5000:5000 flask-app`
5. Access the app in your browser at `http://localhost:5000`

### Kubernetes Deployment

1. **Apply the deployment:** `kubectl apply -f flask-deployment.yaml`
2. **Create a service:**  A service is required to expose your application. Create a service file (e.g., `flask-service.yaml`) and apply it: `kubectl apply -f flask-service.yaml`  (See Kubernetes documentation for creating services.)


## Application Structure

* `/app`: Contains the Flask application code.
* `/app/templates`: Contains the HTML templates for the application.
* `Dockerfile`:  Defines the Docker image build process.
* `flask-deployment.yaml`: Kubernetes deployment configuration.
* `requirements.txt`:  Lists the Python dependencies.