---
title: "autopush"

description: "A Helm chart for Kubernetes"

---

# autopush

![Version: 0.0.3](https://img.shields.io/badge/Version-0.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.72.2](https://img.shields.io/badge/AppVersion-1.72.2-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

= Beta

WARNING
====
We let it run in production, but it is not stable / complete.

TODOs:
  - [ ] official container with redis backend, see: https://github.com/mozilla-services/autopush-rs/pull/813
  - [ ] automatical create CRYPT_KEY (instatt of key)
  - [ ] better ingress / host name support
  - [ ] Improve monitoring with alerts and grafana dashboard
 
====

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/autopush
```

You can install a chart release using the following command:

```bash
helm install autopush-release oci://codeberg.org/wrenix/helm-charts/autopush --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall autopush-release
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://docker.io/bitnamicharts | redis | 20.6.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| autoconnect.affinity | object | `{}` |  |
| autoconnect.image.pullPolicy | string | `"IfNotPresent"` |  |
| autoconnect.image.registry | string | `"codeberg.org"` |  |
| autoconnect.image.repository | string | `"wrenix/autopush/autoconnect"` |  |
| autoconnect.image.tag | string | `"latest"` |  |
| autoconnect.livenessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | This is to setup the liveness and readiness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| autoconnect.nodeSelector | object | `{}` |  |
| autoconnect.podAnnotations | object | `{}` | This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/  |
| autoconnect.podLabels | object | `{}` | This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| autoconnect.podSecurityContext | object | `{}` |  |
| autoconnect.readinessProbe.httpGet.path | string | `"/health"` |  |
| autoconnect.readinessProbe.httpGet.port | string | `"http"` |  |
| autoconnect.replicaCount | int | `1` | This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ |
| autoconnect.resources | object | `{}` | We usually recommend not to specify default resources and to leave this as a conscious choice for the user. This also increases chances charts run on environments with little resources, such as Minikube. If you do want to specify resources, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'resources:'. limits:   cpu: 100m   memory: 128Mi requests:   cpu: 100m   memory: 128Mi |
| autoconnect.securityContext | object | `{}` | securityContext capabilities:   drop:   - ALL readOnlyRootFilesystem: true runAsNonRoot: true runAsUser: 1000 |
| autoconnect.service.port | int | `80` |  |
| autoconnect.service.type | string | `"ClusterIP"` |  |
| autoconnect.tolerations | list | `[]` |  |
| autoconnect.volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. - name: foo   mountPath: "/etc/foo"   readOnly: true |
| autoendpoint.affinity | object | `{}` |  |
| autoendpoint.image.pullPolicy | string | `"IfNotPresent"` |  |
| autoendpoint.image.registry | string | `"codeberg.org"` |  |
| autoendpoint.image.repository | string | `"wrenix/autopush/autoendpoint"` |  |
| autoendpoint.image.tag | string | `"latest"` |  |
| autoendpoint.livenessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | This is to setup the liveness and readiness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| autoendpoint.nodeSelector | object | `{}` |  |
| autoendpoint.podAnnotations | object | `{}` |  |
| autoendpoint.podLabels | object | `{}` |  |
| autoendpoint.podSecurityContext | object | `{}` |  |
| autoendpoint.readinessProbe.httpGet.path | string | `"/health"` |  |
| autoendpoint.readinessProbe.httpGet.port | string | `"http"` |  |
| autoendpoint.replicaCount | int | `1` | This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ |
| autoendpoint.resources | object | `{}` | We usually recommend not to specify default resources and to leave this as a conscious choice for the user. This also increases chances charts run on environments with little resources, such as Minikube. If you do want to specify resources, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'resources:'. limits:   cpu: 100m   memory: 128Mi requests:   cpu: 100m   memory: 128Mi |
| autoendpoint.securityContext | object | `{}` |  |
| autoendpoint.service.port | int | `80` |  |
| autoendpoint.service.type | string | `"ClusterIP"` |  |
| autoendpoint.tolerations | list | `[]` |  |
| autoendpoint.volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. - name: foo   mountPath: "/etc/foo"   readOnly: true |
| config.cryptoKey | string | `""` | run https://github.com/mozilla-services/autopush-rs/blob/master/scripts/fernet_key.py |
| config.logs.backtrace | bool | `false` | enable backtrace of autopush |
| config.logs.level | string | `"warn"` | set log level of autopush |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| imagePullSecrets | list | `[]` | This is for the secretes for pulling an image from a private repository more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.host | string | `"chart-example.local"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` | This is to override the chart name. |
| prometheus.enabled | bool | `true` | start statsd sidecar and configure |
| prometheus.image.pullPolicy | string | `"IfNotPresent"` |  |
| prometheus.image.registry | string | `"docker.io"` |  |
| prometheus.image.repository | string | `"prom/statsd-exporter"` |  |
| prometheus.image.tag | string | `"v0.28.0"` |  |
| prometheus.livenessProbe | object | `{"httpGet":{"path":"/","port":"metrics"}}` | This is to setup the liveness and readiness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| prometheus.readinessProbe.httpGet.path | string | `"/"` |  |
| prometheus.readinessProbe.httpGet.port | string | `"metrics"` |  |
| prometheus.resources | object | `{}` | We usually recommend not to specify default resources and to leave this as a conscious choice for the user. This also increases chances charts run on environments with little resources, such as Minikube. If you do want to specify resources, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'resources:'. limits:   cpu: 100m   memory: 128Mi requests:   cpu: 100m   memory: 128Mi |
| prometheus.securityContext | object | `{}` | securityContext capabilities:   drop:   - ALL readOnlyRootFilesystem: true runAsNonRoot: true runAsUser: 1000 |
| prometheus.servicemonitor.enabled | bool | `false` |  |
| prometheus.servicemonitor.labels | object | `{}` |  |
| prometheus.volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. - name: foo   mountPath: "/etc/foo"   readOnly: true |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.enabled | bool | `true` |  |
| redis.auth.existingSecret | string | `nil` | Or use existing secret with "redis-password" key instead of static password |
| redis.auth.password | string | `"autopush"` | XXX Change me! |
| redis.dbid | int | `0` | Database ID for non-default database |
| redis.external.existingSecretPasswordKey | string | `"redis-password"` | Password key to be retrieved from existing secret |
| redis.external.host | string | `"redis"` |  |
| redis.external.port | int | `6379` |  |
| redis.internal | bool | `true` |  |
| redis.master.kind | string | `"Deployment"` |  |
| redis.master.persistence.enabled | bool | `false` |  |
| redis.master.service.port | int | `6379` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. - name: foo   secret:     secretName: mysecret     optional: false |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)

