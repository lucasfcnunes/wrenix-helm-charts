---
title: "conduit"

description: "Conduit is a simple, fast and reliable chat server powered by Matrix."

---

# conduit

![Version: 1.0.5](https://img.shields.io/badge/Version-1.0.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.9.0](https://img.shields.io/badge/AppVersion-0.9.0-informational?style=flat-square)

Conduit is a simple, fast and reliable chat server powered by Matrix.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/conduit
```

You can install a chart release using the following command:

```bash
helm install conduit-release oci://codeberg.org/wrenix/helm-charts/conduit --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall conduit-release
```

## Values

### well known

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| wellknown.affinity | object | `{}` | pod affinity |
| wellknown.client | object | `{"m.homeserver":{"base_url":"https://your.server.name/"},"org.matrix.msc3575.proxy":{"url":"https://your.server.name/"}}` | client entry in well-known |
| wellknown.containerPort | int | `80` | port webservice |
| wellknown.enabled | bool | `false` | enable/deploy add extra webservice for well-known urls |
| wellknown.env | list | `[]` | pod env |
| wellknown.image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| wellknown.image.registry | string | `"docker.io"` | image registry (could be overwritten by global.image.registry) |
| wellknown.image.repository | string | `"library/nginx"` | image repository |
| wellknown.image.tag | string | `"1.27.5"` | image tag |
| wellknown.nginxServerConf | string | `"server {\n    listen       {{ .containerPort }};\n    server_name  localhost;\n\n    location /.well-known/matrix/server {\n      return 200 {{ toJson .server | quote }};\n      types { } default_type \"application/json; charset=utf-8\";\n    }\n\n    location /.well-known/matrix/client {\n      return 200 {{ toJson .client | quote }};\n      types { } default_type \"application/json; charset=utf-8\";\n      add_header \"Access-Control-Allow-Origin\" *;\n    }\n\n    location / {\n      # return 200 'Welcome to the your.server.name conduit server!';\n      # types { } default_type \"text/plain; charset=utf-8\";\n      return 404;\n    }\n\n    location /nginx_health {\n      return 200 'OK';\n      types { } default_type \"text/plain; charset=utf-8\";\n    }\n}"` | nginx config |
| wellknown.nodeSelector | object | `{}` | pod node selector |
| wellknown.podAnnotations | list | `[]` | pod annotations |
| wellknown.podLabels | object | `{}` | pod labels |
| wellknown.podSecurityContext | object | `{}` | securityContext of Pod |
| wellknown.replicaCount | int | `1` | replicas |
| wellknown.resources | object | `{}` | pod resources |
| wellknown.rewriteRoot | bool | `false` | if ingress is enabled: specifies whether ingress should redirect the `/`-Location to the wellknown server |
| wellknown.securityContext | object | `{}` | securityContext of container |
| wellknown.server | object | `{"m.server":"your.server.name:443"}` | server entry in well-known |
| wellknown.service.annotations | object | `{}` | annotations of service |
| wellknown.service.port | int | `8080` | port of service |
| wellknown.service.type | string | `"ClusterIP"` | service type |
| wellknown.tolerations | list | `[]` | pod tolerations |

### Other Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| conduit.allowEncryption | bool | `true` |  |
| conduit.allowFederation | bool | `true` |  |
| conduit.allowRegistration | bool | `false` |  |
| conduit.allowRoomCreation | bool | `true` |  |
| conduit.allowUnstableRoomVersions | bool | `true` |  |
| conduit.log | string | `nil` |  |
| conduit.maxConcurrentRequests | string | `nil` |  |
| conduit.maxRequestSize | string | `"20000000"` | in bytes default 20 MB |
| conduit.registrationToken | string | `nil` |  |
| conduit.server_name | string | `"your.server.name"` |  |
| conduit.trustedServers[0] | string | `"matrix.org"` |  |
| conduit.wellKnown.client | string | `""` | client well-known configuration in conduit |
| conduit.wellKnown.server | string | `"https://your.server.name"` | server well-known configuration in conduit |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| image.registry | string | `"docker.io"` | image registry (could be overwritten by global.image.registry) |
| image.repository | string | `"matrixconduit/matrix-conduit"` | image repository |
| image.tag | string | `""` | image tag - Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
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
| replicaCount | int | `1` | replicas |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `6167` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
