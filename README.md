# docker-llama - Docker Deployment for llama 2

## Introduction
This repository offers a Docker container setup for the efficient deployment and management of the llama 2 machine learning model, ensuring streamlined integration and operational consistency.

The follwoing are the instructions for deploying the Llama machine learning model using Docker. The provided `docker-compose.yml` file simplifies the process, ensuring a consistent and scalable setup.

## Prerequisites
- Docker installed on your machine.
- Docker Compose (version 3.6 or later).
- Basic understanding of Docker and Docker Compose.

## docker-compose.yml Overview
The `docker-compose.yml` file defines the configuration for deploying the Llama ML model in a Docker container. Key components include:
- **Build Context and Dockerfile**: Specifies the build context and Dockerfile for the Docker image.
- **Model and Repository Arguments**: Includes arguments for the model name (`MODEL`) and the Hugging Face repository (`HF_REPO`).
- **Port Configuration**: Maps the container's port 8000 to the host's port 8000.
- **Container Name**: The name of the container is set to `llama`.

## Deployment Steps
1. **Clone the Repository**: Clone the GitHub repository containing the `docker-compose.yml` file.
   
2. **Navigate to the Directory**: Change to the directory containing the `docker-compose.yml` file.
   
3. **Run Docker Compose**: Execute the following command:
```bash
docker-compose up --build
```
This command builds and starts the Llama container.

4. **Verify Deployment**: Once the container is running, the llama 2 model will be accessible on port 8000 of your host machine.

## Customization
- **Port**: To change the exposed port, modify the `ports` section in the `docker-compose.yml` file.
- **Model Name and Repository**: Update the `MODEL` and `HF_REPO` arguments in the `args` section for different model deployments.

## Support and Feedback
For support, questions, or feedback, please open an issue in the GitHub repository.

This Docker Compose setup offers a straightforward way to deploy the Llama ML model, ensuring ease of use and consistency across different environments.

