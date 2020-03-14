# k8s supporting folding@home

[After NVIDIA asked Gamers to help folding@home to fight against COVID-19 I thought plenty of Kubernetes clusters also have unused resources to donate.](https://twitter.com/NVIDIAGeForce/status/1238496311776653312)

This repository contains a dockerfile, a helm chart and also a simple Kubernetes configuration to get folding@home running at your own clusters.

**This was created in a rush. Improvements are warmly welcome**

## Kubernetes

This deploys a daemonset without resource limitation but folding-powerlevel is set to light so it should not take that many resources. You can change user, team and powerlevel via environment variables.

```bash
kubectl apply -f https://raw.githubusercontent.com/wind0r/k8s-supporting-folding-at-home/master/kubernetes/
```

## Helm

This deploys a daemonset via helm with folding-powerlevel set to medium. You can add resource limitation and change other settings via values files like with every other helm chart.

```bash
git clone https://github.com/wind0r/k8s-supporting-folding-at-home.git
helm install folding ./k8s-supporting-folding-at-home/helm
```

## Settings

* User: Anonymous
* Team: 0
* Passkey: (get one here: https://apps.foldingathome.org/getpasskey)
* Power : light/medium/full
