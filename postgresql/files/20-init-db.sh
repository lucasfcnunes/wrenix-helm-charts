{{- range $name, $config := .Values.job.databases }}
echo 'database {{ $name | quote }}:'
psql -tc "SELECT 1 FROM pg_database WHERE datname = {{ $name | squote }}" | grep -q 1
if [ $? -ne 0 ]; then
  psql -c 'CREATE DATABASE {{ $name | quote }} {{ with $config.additionalParams }}{{ . }} {{ end }}';
fi
psql -c 'ALTER DATABASE {{ $name | quote }} OWNER TO {{ $config.owner | quote }}';
psql -c 'GRANT ALL PRIVILEGES ON DATABASE {{ $name | quote }} TO {{ $config.owner | quote }}';
echo ""
{{- end }}
