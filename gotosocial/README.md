---
title: "gotosocial"

description: "With GoToSocial, you can keep in touch with your friends, post, read, and share images and articles. All without being tracked or advertised to!"

---

# gotosocial

![Version: 0.2.15](https://img.shields.io/badge/Version-0.2.15-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.18.2](https://img.shields.io/badge/AppVersion-0.18.2-informational?style=flat-square)

With GoToSocial, you can keep in touch with your friends, post, read, and share images and articles. All without being tracked or advertised to!

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WrenIX |  | <https://wrenix.eu> |

## Usage

Helm must be installed and setup to your kubernetes cluster to use the charts.
Refer to Helm's [documentation](https://helm.sh/docs) to get started.
Once Helm has been set up correctly, fetch the charts as follows:

```bash
helm pull oci://codeberg.org/wrenix/helm-charts/gotosocial
```

You can install a chart release using the following command:

```bash
helm install gotosocial-release oci://codeberg.org/wrenix/helm-charts/gotosocial --values values.yaml
```

To uninstall a chart release use `helm`'s delete command:

```bash
helm uninstall gotosocial-release
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
| global.image.pullPolicy | string | `nil` | if set it will overwrite all pullPolicy |
| global.image.registry | string | `nil` | if set it will overwrite all registry entries |
| gotosocial.accountDomain | string | `""` |  |
| gotosocial.accounts.allowCustomCSS | bool | `false` | Allow accounts on this instance to set custom CSS for their profile pages and statuses. Enabling this setting will allow accounts to upload custom CSS via the /user settings page, which will then be rendered on the web view of the account's profile and statuses.  For instances with public sign ups, it is **HIGHLY RECOMMENDED** to leave this setting on 'false', since setting it to true allows malicious accounts to make their profile pages misleading, unusable or even dangerous to visitors. In other words, you should only enable this setting if you trust the users on your instance not to produce harmful CSS.  Regardless of what this value is set to, any uploaded CSS will not be federated to other instances, it will only be shown on profiles and statuses on *this* instance. |
| gotosocial.accounts.approvalRequired | bool | `true` | Do sign up requests require approval from an admin/moderator before an account can sign in/use the server? |
| gotosocial.accounts.customCSSLength | int | `10000` | If accounts-allow-custom-css is true, this is the permitted length in characters for CSS uploaded by accounts on this instance. No effect if accounts-allow-custom-css is false. |
| gotosocial.accounts.reasonRequired | bool | `true` | Are sign up requests required to submit a reason for the request (eg., an explanation of why they want to join the instance)? |
| gotosocial.accounts.registrationOpen | bool | `true` | Do we want people to be able to just submit sign up requests, or do we want invite only? |
| gotosocial.advancedRateLimitExceptions | list | `[]` |  |
| gotosocial.advancedRateLimitRequests | int | `300` |  |
| gotosocial.applicationName | string | `"gotosocial"` |  |
| gotosocial.database.address | string | `""` | Database address or parameters. For Postgres, this should be the address or socket at which the database can be reached. |
| gotosocial.database.database | string | `"gotosocial"` | Name of the database to use within the provided database type. |
| gotosocial.database.password | string | `""` | Password to use for the database connection |
| gotosocial.database.port | int | `5432` | Port for database connection. |
| gotosocial.database.tlsCACert | string | `""` | Path to a CA certificate on the host machine for db certificate validation. If this is left empty, just the host certificates will be used. If filled in, the certificate will be loaded and added to host certificates. |
| gotosocial.database.tlsMode | string | `"disabled"` | Disable, enable, or require SSL/TLS connection to the database. If "disable" then no TLS connection will be attempted. If "enable" then TLS will be tried, but the database certificate won't be checked (for self-signed certs). If "require" then TLS will be required to make a connection, and a valid certificate must be presented. |
| gotosocial.database.type | string | `"sqlite"` | Database type. Options: ["postgres","sqlite"] |
| gotosocial.database.username | string | `""` | Username for the database connection. |
| gotosocial.host | string | `"localhost"` |  |
| gotosocial.instance.deliverToSharedInboxes | bool | `true` | This flag tweaks whether GoToSocial will deliver ActivityPub messages to the shared inbox of a recipient, if one is available, instead of delivering each message to each actor who should receive a message individually.  Shared inbox delivery can significantly reduce network load when delivering to multiple recipients share an inbox (eg., on large Mastodon instances).  See: https://www.w3.org/TR/activitypub/#shared-inbox-delivery |
| gotosocial.instance.expose.peers | bool | `false` | Allow unauthenticated users to make queries to /api/v1/instance/peers?filter=open in order to see a list of instances that this instance 'peers' with. Even if set to 'false', then authenticated users (members of the instance) will still be able to query the endpoint. |
| gotosocial.instance.expose.publicTimeline | bool | `false` | This flag tweaks whether GoToSocial will deliver ActivityPub messages to the shared inbox of a recipient, if one is available, instead of delivering each message to each actor who should receive a message individually.  Shared inbox delivery can significantly reduce network load when delivering to multiple recipients share an inbox (eg., on large Mastodon instances).  See: https://www.w3.org/TR/activitypub/#shared-inbox-delivery |
| gotosocial.instance.expose.suspended | bool | `false` | Allow unauthenticated users to make queries to /api/v1/instance/peers?filter=suspended in order to see a list of instances that this instance blocks/suspends. Even if set to 'false', then authenticated users (members of the instance) will still be able to query the endpoint.  WARNING: Setting this variable to 'true' may result in your instance being scraped by blocklist scrapers. See: https://docs.gotosocial.org/en/latest/admin/domain_blocks/#block-announce-bots |
| gotosocial.instance.expose.suspendedWeb | bool | `false` | Allow unauthenticated users to view /about/suspended, showing the HTML rendered list of instances that this instance blocks/suspends. |
| gotosocial.instance.federation.mode | string | `"blocklist"` | Federation mode to use for this instance.  "blocklist" -- open federation by default. Only instances that are explicitly                blocked will be denied (unless they are also explicitly allowed).  "allowlist" -- closed federation by default. Only instances that are explicitly                allowed will be able to interact with this instance.  For more details on blocklist and allowlist modes, check the documentation at: https://docs.gotosocial.org/en/latest/admin/federation_modes  Options: ["blocklist", "allowlist"] |
| gotosocial.instance.federation.spamFilter | bool | `false` | Enable spam filtering heuristics for messages entering your instance via the federation API. Regardless of what you set here, basic checks for message relevancy will still be performed, but you can try enabling this setting if you are being spammed with unwanted messages from other instances, and want to more strictly filter out spam messages.  THIS IS CURRENTLY AN EXPERIMENTAL SETTING, AND MAY FILTER OUT LEGITIMATE MESSAGES, OR FAIL TO FILTER OUT SPAMMY MESSAGES. It is recommended to only enable this setting when the fediverse is in the midst of a spam wave, and you need to batten down the hatches to keep your instance usable.  The decision of whether a message counts as spam or not is made based on the following heuristics, in order, where receiver = the account on your instance that received a message in their inbox, and requester = the account on a remote instance that sent the message.  First, basic relevancy checks   1. Receiver follows requester. Return OK.  2. Statusable doesn't mention receiver. Return NotRelevant.  If instance-federation-spam-filter = false, then return OK now. Otherwise check:   3. Receiver is locked and is followed by requester. Return OK.  4. Five or more people are mentioned. Return Spam.  5. Receiver follow (requests) a mentioned account. Return OK.  6. Statusable has a media attachment. Return Spam.  7. Statusable contains non-mention, non-hashtag links. Return Spam.  Messages identified as spam will be dropped from your instance, and not inserted into the database, or into home timelines or notifications. |
| gotosocial.instance.injectMastodonVersion | bool | `false` | This flag will inject a Mastodon version into the version field that is included in /api/v1/instance. This version is often used by Mastodon clients to do API feature detection. By injecting a Mastodon compatible version, it is possible to cajole those clients to behave correctly with GoToSocial. |
| gotosocial.instance.languages | list | `[]` | BCP47 language tags to indicate preferred languages of users on this instance.  If you provide these, you should provide these in order from most-preferred to least-preferred, but note that leaving out a language from this array doesn't mean it can't be used on this instance, it only means it won't be advertised as a preferred instance language.  It is valid to provide no entries here; your instance will then have no particular preferred language.  See here for commonly-used tags: https://en.wikipedia.org/wiki/IETF_language_tag#List_of_common_primary_language_subtags See here for all current tags: https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry  Example: ["nl", "en-gb", "fr"] |
| gotosocial.landingPageUser | string | `""` |  |
| gotosocial.metrics.auth.enabled | bool | `false` |  |
| gotosocial.metrics.auth.password | string | `""` |  |
| gotosocial.metrics.auth.username | string | `""` |  |
| gotosocial.metrics.enabled | bool | `true` |  |
| gotosocial.oidc.adminGroups | list | `["admins"]` | If the returned ID token contains a 'groups' claim that matches one of the groups in oidc-admin-groups, then this user will be granted admin rights on the GtS instance |
| gotosocial.oidc.clientID | string | `""` | The ID for this client as registered with the OIDC provider. |
| gotosocial.oidc.clientSecret | string | `""` | The secret for this client as registered with the OIDC provider. |
| gotosocial.oidc.enabled | bool | `false` | Enable authentication with external OIDC provider. If set to true, then the other OIDC options must be set as well. If this is set to false, then the standard internal oauth flow will be used, where users sign in to GtS with username/password. |
| gotosocial.oidc.idpName | string | `""` | Name of the oidc idp (identity provider). This will be shown to users when they log in. |
| gotosocial.oidc.issuer | string | `""` | The OIDC issuer URI. This is where GtS will redirect users to for login. Typically this will look like a standard web URL. |
| gotosocial.oidc.linkExisting | bool | `false` | Link OIDC authenticated users to existing ones based on their email address. This is mostly intended for migration purposes if you were running previous versions of GTS which only correlated users with their email address. Should be set to false for most usecases. |
| gotosocial.oidc.scopes | list | `["openid","email","profile","groups"]` | Scopes to request from the OIDC provider. The returned values will be used to populate users created in GtS as a result of the authentication flow. 'openid' and 'email' are required. 'profile' is used to extract a username for the newly created user. 'groups' is optional and can be used to determine if a user is an admin based on oidc-admin-groups. |
| gotosocial.oidc.skipVerification | bool | `false` | Skip the normal verification flow of tokens returned from the OIDC provider, ie., don't check the expiry or signature. This should only be used in debugging or testing, never ever in a production environment as it's extremely unsafe! |
| gotosocial.smtp.discloseRecipients | bool | `false` | If true, when an email is sent that has multiple recipients, each recipient will be included in the To field, so that each recipient can see who else got the email, and they can 'reply all' to the other recipients if they want to.  If false, email will be sent to Undisclosed Recipients, and each recipient will not be able to see who else received the email.  It might be useful to change this setting to 'true' if you want to be able to discuss new moderation reports with other admins by 'replying-all' to the notification email. |
| gotosocial.smtp.from | string | `""` | 'From' address for sent emails. |
| gotosocial.smtp.host | string | `""` | The hostname of the smtp server you want to use. If this is not set, smtp will not be used to send emails, and you can ignore the other settings. |
| gotosocial.smtp.password | string | `""` | Password to use when authenticating with the smtp server. This should have been provided to you by your smtp host. |
| gotosocial.smtp.port | int | `0` | Port to use to connect to the smtp server. |
| gotosocial.smtp.username | string | `""` | Username to use when authenticating with the smtp server. This should have been provided to you by your smtp host. This is often, but not always, an email address. |
| gotosocial.storage.backend | string | `"local"` | Type of storage backend to use. Examples: ["local", "s3"] Default: "local" (storage on local disk) |
| gotosocial.storage.s3.accessKey | string | `""` | Access key part of the S3 credentials. Consider setting this value using environment variables to avoid leaking it via the config file Only required when running with the s3 storage backend. |
| gotosocial.storage.s3.bucket | string | `""` | Name of the storage bucket.  If you have already encoded your bucket name in the storage-s3-endpoint, this value will be used as a directory containing your data.  The bucket must exist prior to starting GoToSocial  Only required when running with the s3 storage backend. |
| gotosocial.storage.s3.endpoint | string | `""` | API endpoint of the S3 compatible service. Only required when running with the s3 storage backend. GoToSocial uses "DNS-style" when accessing buckets. If you are using Scaleways object storage, please remove the "bucket name" from the endpoint address |
| gotosocial.storage.s3.proxy | bool | `false` | If data stored in S3 should be proxied through GoToSocial instead of redirecting to a presigned URL. |
| gotosocial.storage.s3.secretKey | string | `""` | Secret key part of the S3 credentials. Consider setting this value using environment variables to avoid leaking it via the config file Only required when running with the s3 storage backend. |
| gotosocial.storage.s3.useSSL | bool | `true` | Use SSL for S3 connections.  Only set this to 'false' when testing locally. |
| gotosocial.tracing.enabled | bool | `false` | Enable OpenTelemetry based tracing support. |
| gotosocial.tracing.endpoint | string | `""` | Endpoint of the trace ingester. When using the gRPC or HTTP based transports, provide the endpoint as a single address/port combination without a protocol scheme. |
| gotosocial.tracing.insecureTransport | bool | `false` | Disable TLS for the gRPC and HTTP transport protocols. |
| gotosocial.tracing.transport | string | `"grpc"` | Set the transport protocol for the tracing system. Can either be "grpc" for OTLP gRPC, or "http" for OTLP HTTP. |
| gotosocial.trustedProxies[0] | string | `"10.42.0.0/16"` |  |
| gotosocial.trustedProxies[1] | string | `"127.0.0.1/32"` |  |
| gotosocial.trustedProxies[2] | string | `"::1"` |  |
| gotosocial.tz | string | `"UTC"` |  |
| image.pullPolicy | string | `"IfNotPresent"` | This sets the pull policy for images. (could be overwritten by global.image.pullPolicy) |
| image.registry | string | `"docker.io"` | image registry (could be overwritten by global.image.registry) |
| image.repository | string | `"superseriousbusiness/gotosocial"` | image repository |
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
| persistence.accessMode | string | `"ReadWriteOnce"` | accessMode |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `true` | Enable persistence using Persistent Volume Claims ref: http://kubernetes.io/docs/user-guide/persistent-volumes/ |
| persistence.existingClaim | string | `nil` | A manually managed Persistent Volume and Claim Requires persistence.enabled: true If defined, PVC must be created manually before volume will be bound |
| persistence.hostPath | string | `nil` | Do not create an PVC, direct use hostPath in Pod |
| persistence.size | string | `"10Gi"` | size |
| persistence.storageClass | string | `nil` | Persistent Volume Storage Class If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack) |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| prometheus.servicemonitor.enabled | bool | `false` |  |
| prometheus.servicemonitor.labels | object | `{}` |  |
| replicaCount | int | `1` | replicas |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use.  If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)

