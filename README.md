# Simple Node.js Containerized App

A lightweight Node.js application packaged using Docker for consistent deployment.

## Features
* Built with Node.js and Express (if applicable).
* Fully containerized using Docker.
* Easy to deploy and scale.

## Prerequisites
* [Docker](https://www.docker.com/)
* [Node.js](https://nodejs.org/) (for local development)

## Getting Started

### 1. Clone the repository
git clone https://github.com/sair05/Devops.git


### 2. Build the Docker Image
docker build -t node-js-app .

### 3. Run the Container
docker run -p 3000:3000 node-js-app

this is main change