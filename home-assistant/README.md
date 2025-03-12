---
title: "home-assistant"

description: "Home Assistant with tooling to run on an k3s pi"

---

# home-assistant

![Version: 0.3.13](https://img.shields.io/badge/Version-0.3.13-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2025.3.2](https://img.shields.io/badge/AppVersion-2025.3.2-informational?style=flat-square)

Home Assistant with tooling to run on an k3s pi

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/home-assistant
```

You can install a chart release using the following command:

```bash
helm install home-assistant-release oci://codeberg.org/wrenix/helm-charts/home-assistant --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall home-assistant-release
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"home-assistant/home-assistant"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| nats.enabled | bool | `true` |  |
| nats.image.pullPolicy | string | `"IfNotPresent"` |  |
| nats.image.registry | string | `"docker.io"` |  |
| nats.image.repository | string | `"library/nats"` |  |
| nats.image.tag | string | `"2.10.26-scratch"` |  |
| nats.livenessProbe.tcpSocket.port | string | `"nats"` |  |
| nats.readinessProbe.tcpSocket.port | string | `"nats"` |  |
| nats.resources.limits.cpu | string | `"100m"` |  |
| nats.resources.limits.memory | string | `"128Mi"` |  |
| nats.resources.requests.cpu | string | `"100m"` |  |
| nats.resources.requests.memory | string | `"128Mi"` |  |
| nats.service.port.mqtt | int | `1883` |  |
| nats.service.port.nats | int | `4222` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `nil` | A manually managed Persistent Volume and Claim Requires persistence.enabled: true If defined, PVC must be created manually before volume will be bound |
| persistence.hostPath | string | `nil` |  |
| persistence.size | string | `"1Gi"` |  |
| persistence.storageClass | string | `nil` | data Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack)  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| prometheus.podmonitor.bearerTokenSecret | object | `{}` |  |
| prometheus.podmonitor.enabled | bool | `false` |  |
| prometheus.podmonitor.labels | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |
| zigbee2mqtt.config.homeassistant.enabled | bool | `true` |  |
| zigbee2mqtt.config.serial.port | string | `"/dev/ttyACM0"` |  |
| zigbee2mqtt.device | string | `"/dev/ttyACM0"` |  |
| zigbee2mqtt.enabled | bool | `true` |  |
| zigbee2mqtt.image.pullPolicy | string | `"IfNotPresent"` |  |
| zigbee2mqtt.image.registry | string | `"docker.io"` |  |
| zigbee2mqtt.image.repository | string | `"koenkk/zigbee2mqtt"` |  |
| zigbee2mqtt.image.tag | string | `"2.1.3"` |  |
| zigbee2mqtt.ingress.hosts | list | `[]` |  |
| zigbee2mqtt.securityContext.privileged | bool | `true` |  |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
