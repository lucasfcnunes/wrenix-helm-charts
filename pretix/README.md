---
title: "pretix"

description: "Reinventing ticket presales, one ticket at a time."

---

# pretix

![Version: 0.1.22](https://img.shields.io/badge/Version-0.1.22-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2025.4.0](https://img.shields.io/badge/AppVersion-2025.4.0-informational?style=flat-square)

Reinventing ticket presales, one ticket at a time.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Source Code

* <https://github.com/pretix/pretix>
* <https://codeberg.org/wrenix/helm-charts/src/branch/main/pretix>
* <https://hub.docker.com/r/pretix/standalone>

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/pretix
```

You can install a chart release using the following command:

```bash
helm install pretix-release oci://codeberg.org/wrenix/helm-charts/pretix --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall pretix-release
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://docker.io/bitnamicharts | postgresql | ^16.3.1 |
| oci://docker.io/bitnamicharts | redis | 21.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| cronSchedule | string | `"*/30 * * * *"` |  |
| env.PRETIX_CELERY_BACKEND | string | `"redis://:changeme@pretix-redis-master/1"` |  |
| env.PRETIX_CELERY_BROKER | string | `"redis://:changeme@pretix-redis-master/2"` |  |
| env.PRETIX_DATABASE_BACKEND | string | `"postgresql"` |  |
| env.PRETIX_DATABASE_HOST | string | `"pretix-postgresql"` |  |
| env.PRETIX_DATABASE_NAME | string | `"pretix"` |  |
| env.PRETIX_DATABASE_PASSWORD | string | `"pretix"` |  |
| env.PRETIX_DATABASE_USER | string | `"pretix"` |  |
| env.PRETIX_MAIL_FROM | string | `"test@example.com"` |  |
| env.PRETIX_MAIL_HOST | string | `nil` |  |
| env.PRETIX_MAIL_PASSWORD | string | `nil` |  |
| env.PRETIX_MAIL_PORT | int | `587` |  |
| env.PRETIX_MAIL_TLS | bool | `true` |  |
| env.PRETIX_MAIL_USER | string | `nil` |  |
| env.PRETIX_METRICS_ENABLED | bool | `false` |  |
| env.PRETIX_METRICS_PASSPHRASE | string | `"pretix"` |  |
| env.PRETIX_METRICS_USER | string | `"pretix"` |  |
| env.PRETIX_PRETIX_CURRENCY | string | `"EUR"` |  |
| env.PRETIX_PRETIX_DATADIR | string | `"/data"` |  |
| env.PRETIX_PRETIX_INSTANCE_NAME | string | `"Pretix Helm"` |  |
| env.PRETIX_PRETIX_TRUST_X_FORWARDED_FOR | bool | `true` |  |
| env.PRETIX_PRETIX_TRUST_X_FORWARDED_PROTO | bool | `true` |  |
| env.PRETIX_PRETIX_URL | string | `"http://localhost"` |  |
| env.PRETIX_REDIS_LOCATION | string | `"redis://:changeme@pretix-redis-master/0"` |  |
| env.PRETIX_REDIS_SESSIONS | bool | `true` |  |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| grafana.dashboards.annotations | object | `{}` |  |
| grafana.dashboards.enabled | bool | `false` |  |
| grafana.dashboards.labels.grafana_dashboard | string | `"1"` |  |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| image.registry | string | `"docker.io"` | image registry (could be overwritten by global.image.registry) |
| image.repository | string | `"pretix/standalone"` | image repository |
| image.tag | string | `""` | image tag - Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.httpHeaders[0].name | string | `"host"` |  |
| livenessProbe.httpGet.httpHeaders[0].value | string | `"localhost"` |  |
| livenessProbe.httpGet.path | string | `"/healthcheck/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `nil` | A manually managed Persistent Volume and Claim Requires persistence.enabled: true If defined, PVC must be created manually before volume will be bound |
| persistence.hostPath | string | `nil` | Do not create an PVC, direct use hostPath in Pod |
| persistence.size | string | `"5Gi"` |  |
| persistence.storageClass | string | `nil` | Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack)  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.auth.database | string | `"pretix"` |  |
| postgresql.auth.password | string | `"pretix"` |  |
| postgresql.auth.postgresPassword | string | `"supersecureadminpassword"` |  |
| postgresql.auth.username | string | `"pretix"` |  |
| postgresql.enabled | bool | `true` |  |
| prometheus.rules.additionalRules | list | `[]` |  |
| prometheus.rules.enabled | bool | `false` |  |
| prometheus.rules.labels | object | `{}` |  |
| prometheus.servicemonitor.enabled | bool | `false` | broken, Host need to be localhost on request (instatt of ip) needs: https://github.com/prometheus-operator/prometheus-operator/pull/7003 |
| prometheus.servicemonitor.interval | string | `nil` | interval |
| prometheus.servicemonitor.labels | object | `{}` |  |
| prometheus.servicemonitor.scrapeTimeout | string | `nil` | scrape timeout |
| readinessProbe.httpGet.httpHeaders[0].name | string | `"host"` |  |
| readinessProbe.httpGet.httpHeaders[0].value | string | `"localhost"` |  |
| readinessProbe.httpGet.path | string | `"/healthcheck/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.enabled | bool | `true` |  |
| redis.auth.existingSecret | string | `""` | name of an existing secret with Redis credentials (instead of auth.password), must be created ahead of time |
| redis.auth.existingSecretPasswordKey | string | `""` | Password key to be retrieved from existing secret |
| redis.auth.password | string | `"changeme"` |  |
| redis.enabled | bool | `true` |  |
| redis.global.storageClass | string | `""` |  |
| redis.master.persistence.enabled | bool | `true` |  |
| redis.replica.persistence.enabled | bool | `true` |  |
| replicas.taskworker | int | `1` | replicas of taskworker |
| replicas.web | int | `1` | replicas of web service |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
# pretix

![Version: 0.1.22](https://img.shields.io/badge/Version-0.1.22-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2025.4.0](https://img.shields.io/badge/AppVersion-2025.4.0-informational?style=flat-square)

Reinventing ticket presales, one ticket at a time.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Source Code

* <https://github.com/pretix/pretix>
* <https://codeberg.org/wrenix/helm-charts/src/branch/main/pretix>
* <https://hub.docker.com/r/pretix/standalone>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://docker.io/bitnamicharts | postgresql | ^16.3.1 |
| oci://docker.io/bitnamicharts | redis | 21.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| cronSchedule | string | `"*/30 * * * *"` |  |
| env.PRETIX_CELERY_BACKEND | string | `"redis://:changeme@pretix-redis-master/1"` |  |
| env.PRETIX_CELERY_BROKER | string | `"redis://:changeme@pretix-redis-master/2"` |  |
| env.PRETIX_DATABASE_BACKEND | string | `"postgresql"` |  |
| env.PRETIX_DATABASE_HOST | string | `"pretix-postgresql"` |  |
| env.PRETIX_DATABASE_NAME | string | `"pretix"` |  |
| env.PRETIX_DATABASE_PASSWORD | string | `"pretix"` |  |
| env.PRETIX_DATABASE_USER | string | `"pretix"` |  |
| env.PRETIX_MAIL_FROM | string | `"test@example.com"` |  |
| env.PRETIX_MAIL_HOST | string | `nil` |  |
| env.PRETIX_MAIL_PASSWORD | string | `nil` |  |
| env.PRETIX_MAIL_PORT | int | `587` |  |
| env.PRETIX_MAIL_TLS | bool | `true` |  |
| env.PRETIX_MAIL_USER | string | `nil` |  |
| env.PRETIX_METRICS_ENABLED | bool | `false` |  |
| env.PRETIX_METRICS_PASSPHRASE | string | `"pretix"` |  |
| env.PRETIX_METRICS_USER | string | `"pretix"` |  |
| env.PRETIX_PRETIX_CURRENCY | string | `"EUR"` |  |
| env.PRETIX_PRETIX_DATADIR | string | `"/data"` |  |
| env.PRETIX_PRETIX_INSTANCE_NAME | string | `"Pretix Helm"` |  |
| env.PRETIX_PRETIX_TRUST_X_FORWARDED_FOR | bool | `true` |  |
| env.PRETIX_PRETIX_TRUST_X_FORWARDED_PROTO | bool | `true` |  |
| env.PRETIX_PRETIX_URL | string | `"http://localhost"` |  |
| env.PRETIX_REDIS_LOCATION | string | `"redis://:changeme@pretix-redis-master/0"` |  |
| env.PRETIX_REDIS_SESSIONS | bool | `true` |  |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| grafana.dashboards.annotations | object | `{}` |  |
| grafana.dashboards.enabled | bool | `false` |  |
| grafana.dashboards.labels.grafana_dashboard | string | `"1"` |  |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| image.registry | string | `"docker.io"` | image registry (could be overwritten by global.image.registry) |
| image.repository | string | `"pretix/standalone"` | image repository |
| image.tag | string | `""` | image tag - Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.httpHeaders[0].name | string | `"host"` |  |
| livenessProbe.httpGet.httpHeaders[0].value | string | `"localhost"` |  |
| livenessProbe.httpGet.path | string | `"/healthcheck/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `nil` | A manually managed Persistent Volume and Claim Requires persistence.enabled: true If defined, PVC must be created manually before volume will be bound |
| persistence.hostPath | string | `nil` | Do not create an PVC, direct use hostPath in Pod |
| persistence.size | string | `"5Gi"` |  |
| persistence.storageClass | string | `nil` | Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack)  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.auth.database | string | `"pretix"` |  |
| postgresql.auth.password | string | `"pretix"` |  |
| postgresql.auth.postgresPassword | string | `"supersecureadminpassword"` |  |
| postgresql.auth.username | string | `"pretix"` |  |
| postgresql.enabled | bool | `true` |  |
| prometheus.rules.additionalRules | list | `[]` |  |
| prometheus.rules.enabled | bool | `false` |  |
| prometheus.rules.labels | object | `{}` |  |
| prometheus.servicemonitor.enabled | bool | `false` | broken, Host need to be localhost on request (instatt of ip) needs: https://github.com/prometheus-operator/prometheus-operator/pull/7003 |
| prometheus.servicemonitor.interval | string | `nil` | interval |
| prometheus.servicemonitor.labels | object | `{}` |  |
| prometheus.servicemonitor.scrapeTimeout | string | `nil` | scrape timeout |
| readinessProbe.httpGet.httpHeaders[0].name | string | `"host"` |  |
| readinessProbe.httpGet.httpHeaders[0].value | string | `"localhost"` |  |
| readinessProbe.httpGet.path | string | `"/healthcheck/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.enabled | bool | `true` |  |
| redis.auth.existingSecret | string | `""` | name of an existing secret with Redis credentials (instead of auth.password), must be created ahead of time |
| redis.auth.existingSecretPasswordKey | string | `""` | Password key to be retrieved from existing secret |
| redis.auth.password | string | `"changeme"` |  |
| redis.enabled | bool | `true` |  |
| redis.global.storageClass | string | `""` |  |
| redis.master.persistence.enabled | bool | `true` |  |
| redis.replica.persistence.enabled | bool | `true` |  |
| replicas.taskworker | int | `1` | replicas of taskworker |
| replicas.web | int | `1` | replicas of web service |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
