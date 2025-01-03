{{/*
Expand the name of the chart.
*/}}
{{- define "autopush.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "autopush.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "autopush.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "autopush.labels" -}}
helm.sh/chart: {{ include "autopush.chart" . }}
{{ include "autopush.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "autopush.selectorLabels" -}}
app.kubernetes.io/name: {{ include "autopush.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "autopush.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "autopush.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Prometheus-sidecar
*/}}
{{- define "autopush.containerPrometheus" -}}
{{- with .Values.prometheus }}
{{- if .enabled }}
- name: statsd-exporter
  securityContext:
    {{- toYaml .securityContext | nindent 4 }}
  {{- with .image }}
  image: "{{ coalesce $.Values.global.image.registry .registry }}/{{ .repository }}:{{ .tag }}"
  imagePullPolicy: {{ coalesce $.Values.global.image.pullPolicy .pullPolicy }}
  {{- end }}
  ports:
    - name: metrics
      containerPort: 9102
      protocol: TCP
  livenessProbe:
    {{- toYaml .livenessProbe | nindent 4 }}
  readinessProbe:
    {{- toYaml .readinessProbe | nindent 4 }}
  resources:
    {{- toYaml .resources | nindent 4 }}
  {{- with .volumeMounts }}
  volumeMounts:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end }}
{{- end }}
{{- end }}
