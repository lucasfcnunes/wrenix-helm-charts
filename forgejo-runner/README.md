# forgejo-runner

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.0.1](https://img.shields.io/badge/AppVersion-3.0.1-informational?style=flat-square)

Deploy runner for an forgejo instance (default codeberg.org)

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| dind.image.pullPolicy | string | `"IfNotPresent"` |  |
| dind.image.registry | string | `"docker.io"` |  |
| dind.image.repository | string | `"library/docker"` |  |
| dind.image.tag | string | `"24.0.6-dind-rootless"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"code.forgejo.org"` |  |
| image.repository | string | `"forgejo/runner"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| kubectl.image.pullPolicy | string | `"IfNotPresent"` |  |
| kubectl.image.registry | string | `"docker.io"` |  |
| kubectl.image.repository | string | `"bitnami/kubectl"` |  |
| kubectl.image.tag | string | `"1.27.7"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| runner.config.create | bool | `true` |  |
| runner.config.existingSecret | string | `""` | use existingSecret instatt |
| runner.config.instance | string | `"https://codeberg.org"` |  |
| runner.config.name | string | `nil` |  |
| runner.config.token | string | `nil` |  |
| securityContext.privileged | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |
