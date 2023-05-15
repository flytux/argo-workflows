# Argo-workflows CI/CD

## Installation and setup (Linux)
```bash
snap install multipass
git clone -b rke2 https://github.com/flytux/argo-workflows.git 
cd argo-workflows
multipass launch -n rke2 --m 8G --disk 50G --cpus 4 --cloud-init cloud-config.yaml
```
