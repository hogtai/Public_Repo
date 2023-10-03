This repository contains Terraform .tf code for creating a Google Kubernetes Engine (GKE) cluster and Kubernetes Agent via Helm

While the Kubernetes Agent is deployed using terraform in this repository. The Kubernetes Agent configuration itself is configured and lives in it's own project so that it can listen for jobs on multiple repositories.

The agent is authenticated into the Kubernetes Cluster (via agent access token) and configured to monitor changes to a particular .yaml file (GitLab runner configuration file).

Note: Project repo is intentionally missing variables.tf file. You will need to add your own variables.tf file and insert with your values
