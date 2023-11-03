# headscale

![Version: 0.2.2](https://img.shields.io/badge/Version-0.2.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.22.3](https://img.shields.io/badge/AppVersion-0.22.3-informational?style=flat-square)

An open source, self-hosted implementation of the Tailscale control server.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| headscale.certmanager.dnsNames[0] | string | `"example.com"` |  |
| headscale.certmanager.enabled | bool | `true` |  |
| headscale.certmanager.issuerRef.group | string | `"cert-manager.io"` |  |
| headscale.certmanager.issuerRef.kind | string | `"ClusterIssuer"` |  |
| headscale.certmanager.issuerRef.name | string | `"letsencrypt-prod"` |  |
| headscale.config.db_path | string | `"/var/lib/headscale/db.sqlite"` |  |
| headscale.config.db_type | string | `"sqlite3"` |  |
| headscale.config.derp.paths | list | `[]` |  |
| headscale.config.derp.server.enabled | bool | `true` |  |
| headscale.config.derp.server.region_code | string | `"headscale"` |  |
| headscale.config.derp.server.region_id | int | `999` |  |
| headscale.config.derp.server.region_name | string | `"Headscale Embedded DERP"` |  |
| headscale.config.derp.server.stun_listen_addr | string | `"0.0.0.0:3478"` |  |
| headscale.config.derp.update_frequency | string | `"24h"` |  |
| headscale.config.derp.urls | list | `[]` |  |
| headscale.config.disable_check_updates | bool | `true` |  |
| headscale.config.grpc_listen_addr | string | `":50443"` |  |
| headscale.config.listen_addr | string | `":8080"` |  |
| headscale.config.metrics_listen_addr | string | `":9090"` |  |
| headscale.config.noise.private_key_path | string | `"/etc/headscale/secrets/noise.key"` |  |
| headscale.config.private_key_path | string | `"/etc/headscale/secrets/wireguard.key"` |  |
| headscale.config.server_url | string | `"http://127.0.0.1:8080"` |  |
| headscale.config.tls_cert_path | string | `"/etc/headscale/certs/tls.crt"` |  |
| headscale.config.tls_key_path | string | `"/etc/headscale/certs/tls.key"` |  |
| headscale.keys.create | bool | `true` | Create a new private key, if not exists |
| headscale.keys.existingSecret | string | `""` | Use an existing secret |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"headscale/headscale"` |  |
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
| prometheus.rules.additionalRules | list | `[]` |  |
| prometheus.rules.enabled | bool | `false` |  |
| prometheus.rules.labels | object | `{}` |  |
| prometheus.servicemonitor.enabled | bool | `false` |  |
| prometheus.servicemonitor.labels | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | string | `nil` |  |
| service.derp.annotations | string | `nil` |  |
| service.derp.port | int | `3478` |  |
| service.derp.type | string | `"LoadBalancer"` |  |
| service.port.grpc | int | `50443` |  |
| service.port.http | int | `8080` |  |
| service.port.metrics | int | `9090` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
