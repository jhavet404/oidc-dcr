{{- define "secret.name" -}}
{{- .Values.secret | default .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "service_account.name" -}}
{{- .Values.security.service_account | default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "role.name" -}}
{{- .Values.security.role | default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "secret.keys" -}}
{{- if eq .Values.mapping.use_default true }}
{{- range $key, $val := .Values.mapping.default_keys }}
{{ $key }}: {{ $val | quote }}
{{- end }}
{{- end }}
{{- range $key, $val := .Values.mapping.key_mapping }}
{{ $key }}: {{ $val | quote }}
{{- end }}
{{- end -}}
