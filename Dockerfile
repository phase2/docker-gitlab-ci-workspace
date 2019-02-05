ARG DOCKER_ENGINE_VERSION=stable

FROM docker:$DOCKER_ENGINE_VERSION

ARG HELM_VERSION=v2.7.2

# @see http://label-schema.org/rc1/
LABEL maintainer="Phase2 <outrigger@phase2technology.com>" \
  # Replacement for the old MAINTAINER directive has fragmented.
  org.label-schema.vendor="Phase2 <outrigger@phase2technology.com>" \
  name="Outrigger GitLab CI Workspace" \
  org.label-schema.name="Outrigger GitLab CI Workspace" \
  org.label-schema.description="A GitLab CI workbench ready to support a container-based pipeline." \
  org.label-schema.vcs-url="https://github.com/phase2/docker-gitlab-ci-workspace" \
  org.label-schema.schema-version="1.0"

RUN apk add --no-cache \
    bash \
    curl \
    openssl \
    py2-pip \
    git \
        && \
    # Install Python tools
    pip install docker-compose \
        && \
    # Install Kubernetes & Environment Management tools
    curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl -o ./install_helm.sh https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get && \
    chmod +x ./install_helm.sh && \
    ./install_helm.sh -v ${HELM_VERSION} && \
    helm init --client-only

COPY root /
