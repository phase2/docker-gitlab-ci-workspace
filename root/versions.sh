#!/bin/bash -e

echo "---------------"
echo "Installed Tools"
echo "---------------"
docker --version
docker-compose --version
python --version
pip --version
echo "kubectl:" $(kubectl version --client --short)
echo "helm:" $(helm version --client --short)
echo "---------------"
echo