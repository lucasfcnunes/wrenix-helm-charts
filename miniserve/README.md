# miniserve

![Version: 0.3.2](https://img.shields.io/badge/Version-0.3.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.24.0](https://img.shields.io/badge/AppVersion-0.24.0-informational?style=flat-square)

A Helm chart for Kubernetes

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
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"docker.io/svenstaro/miniserve"` |  |
| image.tag | string | `""` |  |
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
| persistence.enabled | bool | `false` |  |
| persistence.size | string | `"1Gi"` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"80m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
