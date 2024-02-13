{{- range $username, $password := .Values.job.users }}
echo 'user {{ $username | quote }}:'
psql -tc "SELECT 1 FROM pg_user WHERE usename = {{ $username | squote }}" | grep -q 1;
if [ $? -ne 0 ]; then
  psql -c "CREATE USER \"{{ $username }}\" WITH ENCRYPTED PASSWORD {{ $password | squote }}";
else
  psql -c "ALTER USER \"{{ $username }}\" WITH ENCRYPTED PASSWORD {{ $password | squote }}";
fi
echo ""
{{- end }}
