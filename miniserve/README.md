---
title: "miniserve"

description: "A Helm chart for Kubernetes"

---

# miniserve

![Version: 0.4.8](https://img.shields.io/badge/Version-0.4.8-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.31.0](https://img.shields.io/badge/AppVersion-0.31.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/miniserve
```

You can install a chart release using the following command:

```bash
helm install miniserve-release oci://codeberg.org/wrenix/helm-charts/miniserve --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall miniserve-release
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| data.args | list | `[]` | used for commandline flags |
| data.auth | string | `""` | Set authentication. Currently supported formats: username:password, username:sha256:hash,            username:sha512:hash (e.g. joe:123,            joe:sha256:a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3) |
| data.colorScheme | string | `"squirrel"` | Default color scheme |
| data.colorSchemeDark | string | `"archlinux"` | Default color scheme |
| data.dirsFirst | bool | `true` | List directories first |
| data.enable.tar | bool | `false` | Enable uncompressed tar archive generation |
| data.enable.tarGZ | bool | `false` | Enable gz-compressed tar archive generation |
| data.enable.zip | bool | `false` | Enable zip archive generation WARNING: Zipping large directories can result in out-of-memory exception because zip generation is done in memory and cannot be sent on the fly |
| data.hidden | bool | `false` | Show hidden files |
| data.hideThemeSelector | bool | `false` | Hide theme selector |
| data.hideVersionFooter | bool | `true` | Hide version footer |
| data.index | string | `"index.html"` | Normally, when miniserve serves a directory, it creates a listing for that directory. However, if a directory contains this file, miniserve will serve that file instead. |
| data.noSymlinks | bool | `false` | Hide symlinks in listing and prevent them from being followed |
| data.path | string | `"/data"` | Which path to serve |
| data.prettyURLs | bool | `false` | Activate Pretty URLs mode |
| data.qrcode | bool | `false` | Enable QR code display |
| data.readme | bool | `false` | Enable README.md rendering in directories |
| data.routePrefix | string | `""` | Use a specific route prefix |
| data.showSymlinkInfo | bool | `false` | Visualize symlinks in directory listing |
| data.showWGETFooter | bool | `true` | If enabled, display a wget command to recursively download the current directory |
| data.spa | bool | `false` | Activate SPA (Single Page Application) mode |
| data.title | string | `""` | Shown instead of host in page title and heading |
| data.upload.allowedDir | string | `""` | Enable file uploading (and optionally specify for which directory) |
| data.upload.mediaType | string | `""` | Specify uploadable media types: possible values image, audio, video |
| data.upload.mkdir | bool | `false` | Enable creating directories |
| data.upload.overwriteFiles | bool | `false` | Enable overriding existing files during file upload |
| data.upload.rawMediaType | string | `""` | Directly specify the uploadable media type expression |
| data.verbose | bool | `false` | Be verbose, includes emitting access logs |
| data.webdav.enabled | bool | `false` | If enabled, respond to WebDAV requests (read-only). |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| image.registry | string | `"docker.io"` | image registry (could be overwritten by global.image.registry) |
| image.repository | string | `"svenstaro/miniserve"` | image repository |
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
| networkPolicy.egress.enabled | bool | `true` | activate egress no networkpolicy |
| networkPolicy.egress.extra | list | `[]` | egress rules |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.ingress.http | list | `[]` | ingress for http port (e.g. ingress-controller) |
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
| replicaCount | int | `1` | replicas |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"80m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
