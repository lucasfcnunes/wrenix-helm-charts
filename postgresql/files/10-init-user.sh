{{- range $username, $password := .Values.job.users }}
echo 'user "{{ $username }}":'
psql -tc "SELECT 1 FROM pg_user WHERE usename = '{{ $username }}'" | grep -q 1;
if [ $? -ne 0 ]; then
  psql -c "CREATE USER {{ $username }} WITH ENCRYPTED PASSWORD '{{ $password }}'";
else
  psql -c "ALTER USER {{ $username }} WITH ENCRYPTED PASSWORD '{{ $password }}'";
fi
echo ""
{{- end }}
