# postgresql

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 16.0-alpine3.18](https://img.shields.io/badge/AppVersion-16.0--alpine3.18-informational?style=flat-square)

A Helm chart for running PostgreSQL (Postgres) database

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"postgres"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
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
| persistence.size | string | `"1Gi"` |  |
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
