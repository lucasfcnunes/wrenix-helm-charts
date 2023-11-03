# alertmanager-matrix

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: latest](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

Service for managing and receiving Alertmanager alerts on Matrix

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
| bot.template.html | string | `"{{ range .Alerts }}\n  <font color=\"{{.StatusString|color}}\">\n    {{.StatusString|icon}}\n    <b>{{.StatusString|upper}}</b>\n    {{.AlertName}}:\n  </font>\n  {{.Summary}}\n  {{if ne .Fingerprint \"\"}}\n    ({{.Fingerprint}})\n  {{end}}\n  {{if $.ShowLabels}}\n    <br/>\n    <b>Labels:</b>\n    <code>{{.LabelString}}</code>\n   {{end}}\n   <br/>\n{{- end -}}\n"` |  |
| bot.template.text | string | `"{{ range .Alerts }}\n  {{.StatusString|icon}}\n  {{.StatusString|upper}}\n  {{.AlertName}}:\n  {{.Summary}}\n  {{if ne .Fingerprint \"\"}}\n    ({{.Fingerprint}})\n  {{end}}\n  {{if $.ShowLabels}}\n    , labels:\n    {{.LabelString}}\n  {{end}}\n  \\n\n{{ end -}}\n"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"silkeh/alertmanager_matrix"` |  |
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
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `4051` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
