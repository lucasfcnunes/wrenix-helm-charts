---
title: "element-call"

description: "Run Element-Call and his dependencies"

---

# element-call

![Version: 0.1.16](https://img.shields.io/badge/Version-0.1.16-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.10.0](https://img.shields.io/badge/AppVersion-0.10.0-informational?style=flat-square)

Run Element-Call and his dependencies

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/element-call
```

You can install a chart release using the following command:

```bash
helm install element-call-release oci://codeberg.org/wrenix/helm-charts/element-call --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall element-call-release
```

## Values

### livekit JWT

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| service.lkJWT.config.key | string | `"devkey"` | key to livekit |
| service.lkJWT.config.secret | string | `"secret"` | secret to livekit |
| service.lkJWT.config.url | string | `""` | url to livekit |
| service.lkJWT.enabled | bool | `true` | enable to deploy livekit jwt service for element-call |
| service.lkJWT.image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| service.lkJWT.image.registry | string | `"ghcr.io"` | image registry (could be overwritten by global.image.registry) |
| service.lkJWT.image.repository | string | `"element-hq/lk-jwt-service"` | image repository |
| service.lkJWT.image.tag | string | `"0.2.3"` | image tag |
| service.lkJWT.networkPolicy.egress.enabled | bool | `false` | activate egress no networkpolicy |
| service.lkJWT.networkPolicy.egress.extra | list | `[]` | egress rules |
| service.lkJWT.networkPolicy.ingress.http | list | `[]` | ingress for http port (e.g. ingress-controller) |
| service.lkJWT.replicaCount | int | `1` | replicas |
| service.lkJWT.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| service.lkJWT.serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| service.lkJWT.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| service.lkJWT.serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| service.call.affinity | object | `{}` |  |
| service.call.config | object | `{}` |  |
| service.call.image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| service.call.image.registry | string | `"ghcr.io"` | image registry (could be overwritten by global.image.registry) |
| service.call.image.repository | string | `"element-hq/element-call"` | image repository |
| service.call.image.tag | string | `nil` | image tag - Overrides the image tag whose default is the chart appVersion |
| service.call.ingress.host | string | `nil` |  |
| service.call.livenessProbe.httpGet.path | string | `"/"` |  |
| service.call.livenessProbe.httpGet.port | string | `"http"` |  |
| service.call.networkPolicy.egress.enabled | bool | `true` | activate egress no networkpolicy |
| service.call.networkPolicy.egress.extra | list | `[]` | egress rules |
| service.call.networkPolicy.enabled | bool | `false` |  |
| service.call.networkPolicy.ingress.http | list | `[]` | ingress for http port (e.g. ingress-controller) |
| service.call.nodeSelector | object | `{}` |  |
| service.call.podAnnotations | object | `{}` |  |
| service.call.podLabels | object | `{}` |  |
| service.call.podSecurityContext | object | `{}` |  |
| service.call.readinessProbe.httpGet.path | string | `"/"` |  |
| service.call.readinessProbe.httpGet.port | string | `"http"` |  |
| service.call.replicaCount | int | `1` | replicas |
| service.call.resources | object | `{}` |  |
| service.call.securityContext | object | `{}` |  |
| service.call.serviceAccount.annotations | object | `{}` |  |
| service.call.serviceAccount.automount | bool | `true` |  |
| service.call.serviceAccount.create | bool | `true` |  |
| service.call.serviceAccount.name | string | `""` |  |
| service.call.tolerations | list | `[]` |  |
| service.lkJWT.affinity | object | `{}` |  |
| service.lkJWT.ingress.host | string | `nil` |  |
| service.lkJWT.livenessProbe.httpGet.path | string | `"/healthz"` |  |
| service.lkJWT.livenessProbe.httpGet.port | string | `"http"` |  |
| service.lkJWT.networkPolicy.enabled | bool | `false` |  |
| service.lkJWT.nodeSelector | object | `{}` |  |
| service.lkJWT.podAnnotations | object | `{}` |  |
| service.lkJWT.podLabels | object | `{}` |  |
| service.lkJWT.podSecurityContext | object | `{}` |  |
| service.lkJWT.readinessProbe.httpGet.path | string | `"/healthz"` |  |
| service.lkJWT.readinessProbe.httpGet.port | string | `"http"` |  |
| service.lkJWT.resources | object | `{}` |  |
| service.lkJWT.securityContext | object | `{}` |  |
| service.lkJWT.tolerations | list | `[]` |  |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)

