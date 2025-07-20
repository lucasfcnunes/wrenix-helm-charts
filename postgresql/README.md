---
title: "postgresql"

description: "A Helm chart for running PostgreSQL (Postgres) database"

---

# postgresql

![Version: 0.3.7](https://img.shields.io/badge/Version-0.3.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 17.5-alpine](https://img.shields.io/badge/AppVersion-17.5--alpine-informational?style=flat-square)

A Helm chart for running PostgreSQL (Postgres) database

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/postgresql
```

You can install a chart release using the following command:

```bash
helm install postgresql-release oci://codeberg.org/wrenix/helm-charts/postgresql --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall postgresql-release
```

## Values

### Monitoring

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| grafana.dashboards.annotations | object | `{}` | label of configmap |
| grafana.dashboards.enabled | bool | `false` | deploy grafana dashboard in configmap |
| grafana.dashboards.labels | object | `{"grafana_dashboard":"1"}` | label of configmap |
| prometheus.enabled | bool | `false` | add prometheus exporter sidecar |
| prometheus.image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| prometheus.image.registry | string | `"docker.io"` | image registry (could be overwritten by global.image.registry) |
| prometheus.image.repository | string | `"prometheuscommunity/postgres-exporter"` | image repository |
| prometheus.image.tag | string | `"v0.17.1"` | image tag |
| prometheus.rules.additionalRules | list | `[]` | add own rules to prometheusrules (current no default alertrules are provided) |
| prometheus.rules.defaults.caching | bool | `false` | enable default prometheus rules for caching in PostgreSQL |
| prometheus.rules.enabled | bool | `false` | deploy prometheusrules |
| prometheus.rules.labels | object | `{}` | labels of prometheusrule |
| prometheus.servicemonitor.enabled | bool | `false` | deploy servicemonitor |
| prometheus.servicemonitor.labels | object | `{}` | label of servicemonitor |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoupgrade.enabled | bool | `true` |  |
| autoupgrade.image.pullPolicy | string | `"IfNotPresent"` |  |
| autoupgrade.image.registry | string | `"docker.io"` |  |
| autoupgrade.image.repository | string | `"pgautoupgrade/pgautoupgrade"` |  |
| autoupgrade.image.tag | string | `"17-alpine"` |  |
| autoupgrade.securityContext | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| image.registry | string | `"docker.io"` | image registry (could be overwritten by global.image.registry) |
| image.repository | string | `"library/postgres"` | image repository |
| image.tag | string | `""` | image tag - Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| job.annotations | object | `{"helm.sh/hook":"post-install,post-upgrade","helm.sh/hook-delete-policy":"before-hook-creation,hook-succeeded"}` | Annotations (usefull to delete job by helm afterwards) |
| job.databases | object | `{}` | Bootstrap databases into postgresql server. When databases already exists, they will stay untouched.  databases:  "name_of_database":    owner: "existing_user_which_will_get_grant"    additionalParams: "" # Optional |
| job.enabled | bool | `true` | Enable database bootstrapping. |
| job.retries | int | `60` | Amount of retries while waiting for postgresql server is available. |
| job.users | object | `{}` | Bootstrap users into postgresql server. When users already exists, they will stay untouched.  users:   username: RandomPassword0#" |
| job.wait | int | `5` | Time to wait in each wait in each iteration until postgresql server is available. |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `nil` | A manually managed Persistent Volume and Claim Requires persistence.enabled: true If defined, PVC must be created manually before volume will be bound |
| persistence.hostPath | string | `nil` | Do not create an PVC, direct use hostPath in Pod |
| persistence.size | string | `"1Gi"` |  |
| persistence.storageClass | string | `nil` | Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack) |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgres.password | string | `"SUPERSTRONGPW"` | Database password. |
| postgres.user | string | `"postgres"` | Database user. |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `5432` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
