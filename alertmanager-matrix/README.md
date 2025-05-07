---
title: "alertmanager-matrix"

description: "Service for managing and receiving Alertmanager alerts on Matrix"

---

# alertmanager-matrix

![Version: 0.1.14](https://img.shields.io/badge/Version-0.1.14-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.5.0](https://img.shields.io/badge/AppVersion-0.5.0-informational?style=flat-square)

Service for managing and receiving Alertmanager alerts on Matrix

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/alertmanager-matrix
```

You can install a chart release using the following command:

```bash
helm install alertmanager-matrix-release oci://codeberg.org/wrenix/helm-charts/alertmanager-matrix --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall alertmanager-matrix-release
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| bot.alertmanager | string | `"http://localhost:9093"` |  |
| bot.colors.alert | string | `"black"` |  |
| bot.colors.critical | string | `"red"` |  |
| bot.colors.error | string | `"red"` |  |
| bot.colors.info | string | `"blue"` |  |
| bot.colors.information | string | `"blue"` |  |
| bot.colors.resolved | string | `"green"` |  |
| bot.colors.silenced | string | `"gray"` |  |
| bot.colors.warning | string | `"orange"` |  |
| bot.icons.alert | string | `"🔔️"` |  |
| bot.icons.critical | string | `"🚨"` |  |
| bot.icons.error | string | `"🚨"` |  |
| bot.icons.info | string | `"ℹ️"` |  |
| bot.icons.information | string | `"ℹ️"` |  |
| bot.icons.resolved | string | `"✅"` |  |
| bot.icons.silenced | string | `"🔕"` |  |
| bot.icons.warning | string | `"⚠️"` |  |
| bot.matrix.homeserver | string | `"http://localhost:8008"` |  |
| bot.matrix.rooms[0] | string | `"!not_existing:matrix.org"` |  |
| bot.matrix.rooms[1] | string | `"!also_not_existing:matrix.org"` |  |
| bot.matrix.token | string | `"SECRET_TOKEN"` |  |
| bot.matrix.userID | string | `"bot"` |  |
| bot.messageType | string | `"m.notice"` |  |
| bot.showLabels | bool | `false` |  |
| bot.template.html | string | `"{{ range .Alerts }}\n  <font color=\"{{.StatusString|color}}\">\n    {{.StatusString|icon}}\n    <b>{{.StatusString|upper}}</b>\n    {{.AlertName}}:\n  </font>\n  {{.Summary}}\n  {{if ne .Fingerprint \"\"}}\n    ({{.Fingerprint}})\n  {{end}}\n  {{if $.ShowLabels}}\n    <br/>\n    <b>Labels:</b>\n    <code>{{.LabelString}}</code>\n  {{end}}\n  <br/>\n{{- end -}}\n"` |  |
| bot.template.text | string | `"{{ range .Alerts }}\n  {{- .StatusString|icon}} {{ .StatusString|upper }}{{ .AlertName }}: {{ .Summary }} {{ if ne .Fingerprint \"\" -}}\n    ({{.Fingerprint}})\n  {{- end}}\n  {{- if $.ShowLabels -}}\n    , labels:\n    {{- .LabelString}}\n  {{- end }}\n{{ end -}}\n"` |  |
| fullnameOverride | string | `""` |  |
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| image.registry | string | `"registry.gitlab.com"` | image registry (could be overwritten by global.image.registry) |
| image.repository | string | `"wrenix/alertmanager_matrix"` | image repository |
| image.tag | string | `""` | image tag - Overrides the image tag whose default is the chart appVersion. latest with current:  - amd64      @sha256:2afd6d70f39fdfa98f11758090506f7845aee33cc8d900f9fe39a2574c272063  - 386 /x86   @sha256:beca95e9595de7169ab34406936b585d6676ce03a7fe51815b3a6a4944f9dd6d  - arm v6     @sha256:ce40ea204497bfc9b2e796cf984eba53ba7c59164d39dcd4c11f0ca561e57eca  - arm v7     @sha256:59ce3dfc73be5f70b873fe095e1eee4e0fe1f256b39f8f051ad0a2ffe9d1177e  - arm v8     @sha256:fdbf50e944f8118dd1a44dde21b9cc098fb13837031e2f2492c148848c3d3cc8  - ppc64le    @sha256:4ce02adbf4efe3ad04422e35bd4e87442a7c899fea13988adaeb985c720e0c63  - s390x      @sha256:a202252cc00664a17caa5760f749b35a7b71253d1b1474b861f233e83ada1c76 |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| logging.additionalFilters | list | `[]` | Add other filters to Flow |
| logging.dedot | string | `nil` | if an filter (here or global) for dedot is active - for disable set `null` |
| logging.enabled | bool | `false` | Deploy Flow for logging-operator |
| logging.globalOutputRefs | list | `["default"]` | Flows globalOutputRefs for use of ClusterOutputs |
| logging.localOutputRefs | list | `[]` | Flows localOutputRefs for use of Outputs |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` | replicas |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `4051` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
