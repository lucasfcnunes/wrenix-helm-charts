{{- range $name, $config := .Values.job.databases }}
echo 'database "{{ $name }}":'
psql -tc "SELECT 1 FROM pg_database WHERE datname = '{{ $name }}'" | grep -q 1
if [ $? -ne 0 ]; then
  psql -c "CREATE DATABASE {{ $name }} {{ with $config.additionalParams }}{{ . }} {{ end }}";
fi
psql -c "ALTER DATABASE {{ $name }} OWNER TO {{ $config.owner }}";
psql -c "GRANT ALL PRIVILEGES ON DATABASE {{ $name }} TO {{ $config.owner }}";
echo ""
{{- end }}
