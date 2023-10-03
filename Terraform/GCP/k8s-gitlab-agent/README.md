# Proof of Concept Cluster Deployed in GKE using Terraform for K8s Agent Research (GKE)

This repository contains Terraform .tf code for creating a Google Kubernetes Engine (GKE) cluster using [GitLab Infrastructure as Code](https://docs.gitlab.com/ee/user/infrastructure/), this cluster is used for testing purposes only for [SRE-514 - POC - Kubernetes GitLab Runner](https://lifechurch-ion.atlassian.net/browse/SRE-514)

While the Kubernetes Agent is deployed using terraform in this repository. 

The Kubernetes Agent configuration itself is configured and lives in it's own project so that it can listen for jobs on multiple repositories. [Kubernetes Agent Project Repository ](https://in.thewardro.be/io/interactive/sre/infrastructure/gcp/agent-job-test)

The agent is authenticated into the Kubernetes Cluster (via agent access token) and configured listen for projects within the [Kubernetes Agent Project Repository.](https://in.thewardro.be/io/interactive/sre/infrastructure/gcp/agent-job-test)

