---
title: "autopush"

description: "A Helm chart for Kubernetes"

---

# autopush

![Version: 0.0.17](https://img.shields.io/badge/Version-0.0.17-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.72.2](https://img.shields.io/badge/AppVersion-1.72.2-informational?style=flat-square)

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
| oci://docker.io/bitnamicharts | redis | 20.11.4 |

## Values

### Autoconnect

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| autoconnect.image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| autoconnect.image.registry | string | `"codeberg.org"` | image registry (could be overwritten by global.image.registry) |
| autoconnect.image.repository | string | `"wrenix/autopush/autoconnect"` | image repository |
| autoconnect.image.tag | string | `"latest"` | image tag - Overrides the image tag whose default is the chart appVersion. |
| autoconnect.livenessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | This is to setup the liveness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| autoconnect.podAnnotations | object | `{}` | This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| autoconnect.podLabels | object | `{}` | This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| autoconnect.readinessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | This is to setup the readiness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| autoconnect.replicaCount | int | `1` | This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ |
| autoconnect.resources | object | `{}` | We usually recommend not to specify default resources and to leave this as a conscious choice for the user. This also increases chances charts run on environments with little resources, such as Minikube. If you do want to specify resources, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'resources:'. limits:   cpu: 100m   memory: 128Mi requests:   cpu: 100m   memory: 128Mi |
| autoconnect.securityContext | object | `{}` | securityContext capabilities:   drop:   - ALL readOnlyRootFilesystem: true runAsNonRoot: true runAsUser: 1000 |
| autoconnect.service.ports.http | int | `80` | port of http service |
| autoconnect.service.ports.router | int | `8081` | port of internal router service |
| autoconnect.service.type | string | `"ClusterIP"` | This sets the service type more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| autoconnect.volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. - name: foo   mountPath: "/etc/foo"   readOnly: true |

### Autoendpoint

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| autoendpoint.image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| autoendpoint.image.registry | string | `"codeberg.org"` | image registry (could be overwritten by global.image.registry) |
| autoendpoint.image.repository | string | `"wrenix/autopush/autoendpoint"` | image repository |
| autoendpoint.image.tag | string | `"latest"` | image tag - Overrides the image tag whose default is the chart appVersion. |
| autoendpoint.livenessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | This is to setup the liveness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| autoendpoint.podAnnotations | object | `{}` | This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| autoendpoint.podLabels | object | `{}` | This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| autoendpoint.readinessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | This is to setup the readiness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| autoendpoint.replicaCount | int | `1` | This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ |
| autoendpoint.resources | object | `{}` | We usually recommend not to specify default resources and to leave this as a conscious choice for the user. This also increases chances charts run on environments with little resources, such as Minikube. If you do want to specify resources, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'resources:'. limits:   cpu: 100m   memory: 128Mi requests:   cpu: 100m   memory: 128Mi |
| autoendpoint.service.port | int | `80` | This sets the ports more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports |
| autoendpoint.service.type | string | `"ClusterIP"` | This sets the service type more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| autoendpoint.volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. - name: foo   mountPath: "/etc/foo"   readOnly: true |

### UnifiedPush

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| unifiedPush.enabled | bool | `false` | enable/deploy common-proxy for unifiedpush |
| unifiedPush.image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| unifiedPush.image.registry | string | `"docker.io"` | image registry (could be overwritten by global.image.registry) |
| unifiedPush.image.repository | string | `"unifiedpush/common-proxies"` | image repository |
| unifiedPush.image.tag | string | `"v2.2.0"` | image tag |
| unifiedPush.livenessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | This is to setup the liveness more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| unifiedPush.podAnnotations | object | `{}` | This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| unifiedPush.podLabels | object | `{}` | This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| unifiedPush.readinessProbe | object | `{"httpGet":{"path":"/health","port":"http"}}` | This is to setup the readiness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| unifiedPush.replicaCount | int | `1` | This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ |
| unifiedPush.resources | object | `{}` | We usually recommend not to specify default resources and to leave this as a conscious choice for the user. This also increases chances charts run on environments with little resources, such as Minikube. If you do want to specify resources, uncomment the following lines, adjust them as necessary, and remove the curly braces after 'resources:'. limits:   cpu: 100m   memory: 128Mi requests:   cpu: 100m   memory: 128Mi |
| unifiedPush.service.port | int | `80` | This sets the ports more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports |
| unifiedPush.service.type | string | `"ClusterIP"` | This sets the service type more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| unifiedPush.volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. - name: foo   mountPath: "/etc/foo"   readOnly: true |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| autoconnect.affinity | object | `{}` |  |
| autoconnect.nodeSelector | object | `{}` |  |
| autoconnect.podSecurityContext | object | `{}` |  |
| autoconnect.tolerations | list | `[]` |  |
| autoendpoint.affinity | object | `{}` |  |
| autoendpoint.nodeSelector | object | `{}` |  |
| autoendpoint.podSecurityContext | object | `{}` |  |
| autoendpoint.securityContext | object | `{}` |  |
| autoendpoint.tolerations | list | `[]` |  |
| config.cryptoKey | string | `""` | run https://github.com/mozilla-services/autopush-rs/blob/master/scripts/fernet_key.py |
| config.logs.backtrace | bool | `false` | enable backtrace of autopush |
| config.logs.level | string | `"warn"` | set log level of autopush |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| grafana.dashboards.annotations | object | `{}` |  |
| grafana.dashboards.enabled | bool | `false` |  |
| grafana.dashboards.labels.grafana_dashboard | string | `"1"` |  |
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
| prometheus.rules.additionalRules | list | `[]` |  |
| prometheus.rules.default.alertLabels | object | `{}` |  |
| prometheus.rules.default.enabled | bool | `true` |  |
| prometheus.rules.enabled | bool | `false` |  |
| prometheus.rules.labels | object | `{}` |  |
| prometheus.securityContext | object | `{}` | securityContext capabilities:   drop:   - ALL readOnlyRootFilesystem: true runAsNonRoot: true runAsUser: 1000 |
| prometheus.servicemonitor.enabled | bool | `false` |  |
| prometheus.servicemonitor.labels | object | `{}` |  |
| prometheus.volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. - name: foo   mountPath: "/etc/foo"   readOnly: true |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.enabled | bool | `true` |  |
| redis.auth.existingSecret | string | `""` | name of an existing secret with Redis credentials (instead of auth.password), must be created ahead of time |
| redis.auth.existingSecretPasswordKey | string | `""` | Password key to be retrieved from existing secret |
| redis.auth.password | string | `"autopush"` | XXX Change me! |
| redis.dbid | int | `0` | Database ID for non-default database |
| redis.external.existingSecretPasswordKey | string | `"redis-password"` | Password key to be retrieved from existing secret |
| redis.external.host | string | `"redis"` |  |
| redis.external.port | int | `6379` |  |
| redis.global.storageClass | string | `""` |  |
| redis.internal | bool | `true` |  |
| redis.master.persistence.enabled | bool | `true` |  |
| redis.master.service.port | int | `6379` |  |
| redis.replica.persistence.enabled | bool | `true` |  |
| unifiedPush.affinity | object | `{}` |  |
| unifiedPush.config.gateway.allowedHosts | list | `[]` |  |
| unifiedPush.config.gateway.generic.enable | bool | `true` |  |
| unifiedPush.config.gateway.matrix.enable | bool | `true` |  |
| unifiedPush.config.uaid | string | `""` |  |
| unifiedPush.config.verbose | bool | `false` |  |
| unifiedPush.nodeSelector | object | `{}` |  |
| unifiedPush.podSecurityContext | object | `{}` |  |
| unifiedPush.securityContext | object | `{}` |  |
| unifiedPush.tolerations | list | `[]` |  |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. - name: foo   secret:     secretName: mysecret     optional: false |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)

