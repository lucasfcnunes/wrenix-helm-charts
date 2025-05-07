---
title: "headscale"

description: "An open source, self-hosted implementation of the Tailscale control server."

---

# headscale

![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.23.0](https://img.shields.io/badge/AppVersion-0.23.0-informational?style=flat-square)

An open source, self-hosted implementation of the Tailscale control server.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/headscale
```

You can install a chart release using the following command:

```bash
helm install headscale-release oci://codeberg.org/wrenix/helm-charts/headscale --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall headscale-release
```

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
| headscale.config.database.postgres.host | string | `"localhost"` |  |
| headscale.config.database.postgres.name | string | `"headscale"` |  |
| headscale.config.database.postgres.pass | string | `"bar"` |  |
| headscale.config.database.postgres.port | int | `5432` |  |
| headscale.config.database.postgres.user | string | `"foo"` |  |
| headscale.config.database.sqlite.path | string | `"/var/lib/headscale/db.sqlite"` |  |
| headscale.config.database.type | string | `"sqlite"` |  |
| headscale.config.derp.paths | list | `[]` |  |
| headscale.config.derp.server.enabled | bool | `true` |  |
| headscale.config.derp.server.private_key_path | string | `"/etc/headscale/secrets/derp.key"` |  |
| headscale.config.derp.server.region_code | string | `"headscale"` |  |
| headscale.config.derp.server.region_id | int | `999` |  |
| headscale.config.derp.server.region_name | string | `"Headscale Embedded DERP"` |  |
| headscale.config.derp.server.stun_listen_addr | string | `"0.0.0.0:3478"` |  |
| headscale.config.derp.update_frequency | string | `"24h"` |  |
| headscale.config.derp.urls | list | `[]` |  |
| headscale.config.disable_check_updates | bool | `true` |  |
| headscale.config.dns.base_domain | string | `"example.com"` |  |
| headscale.config.grpc_listen_addr | string | `":50443"` |  |
| headscale.config.listen_addr | string | `":8080"` |  |
| headscale.config.metrics_listen_addr | string | `":9090"` |  |
| headscale.config.noise.private_key_path | string | `"/etc/headscale/secrets/noise.key"` |  |
| headscale.config.prefixes.allocation | string | `"sequential"` |  |
| headscale.config.prefixes.v4 | string | `"100.64.0.0/10"` |  |
| headscale.config.prefixes.v6 | string | `"fd7a:115c:a1e0::/48"` |  |
| headscale.config.private_key_path | string | `"/etc/headscale/secrets/wireguard.key"` |  |
| headscale.config.server_url | string | `"http://127.0.0.1:8080"` |  |
| headscale.config.tls_cert_path | string | `"/etc/headscale/certs/tls.crt"` |  |
| headscale.config.tls_key_path | string | `"/etc/headscale/certs/tls.key"` |  |
| headscale.keys.create | bool | `true` | Create a new private key, if not exists |
| headscale.keys.existingSecret | string | `""` | Use an existing secret |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"juanfont/headscale"` |  |
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
| networkPolicy.egress.enabled | bool | `false` | activate egress no networkpolicy |
| networkPolicy.egress.extra | list | `[]` | egress rules |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.ingress.derp | list | `[{"ipBlock":{"cidr":"0.0.0.0/0"}},{"ipBlock":{"cidr":"::/0"}}]` | ingress for derp |
| networkPolicy.ingress.grpc | list | `[]` | ingress for grpc port |
| networkPolicy.ingress.http | list | `[]` | ingress for http port (e.g. ingress-controller) |
| networkPolicy.ingress.metrics | list | `[]` | ingress for metrics port (e.g. prometheus) |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `nil` | A manually managed Persistent Volume and Claim Requires persistence.enabled: true If defined, PVC must be created manually before volume will be bound |
| persistence.hostPath | string | `nil` | Create a PV on Node with given hostPath storageClass has to be manual |
| persistence.size | string | `"1Gi"` |  |
| persistence.storageClass | string | `nil` | data Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack) |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| prometheus.rules.additionalRules | list | `[]` |  |
| prometheus.rules.defaults.enabled | bool | `true` |  |
| prometheus.rules.defaults.filter | string | `""` |  |
| prometheus.rules.defaults.lastUpdates.critical | int | `3600` |  |
| prometheus.rules.defaults.lastUpdates.info | int | `300` |  |
| prometheus.rules.defaults.lastUpdates.warning | int | `600` |  |
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

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
