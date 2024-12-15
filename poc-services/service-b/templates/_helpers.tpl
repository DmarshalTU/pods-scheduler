{{/*
Generate init containers based on dependencies
*/}}
{{- define "service.initContainers" -}}
{{- $fullName := include "helm.fullname" . -}}
{{- $deps := .Values.dependencies | default list -}}
{{- if and .Values.initContainers.enabled $deps }}
initContainers:
{{- range $dep := $deps }}
- name: wait-for-{{ $dep }}
  image: {{ $.Values.initContainers.containers.image }}
  command:
    - sh
    - -c
    - |
      until wget -qO- http://{{ $dep }}:{{ $.Values.initContainers.containers.healthCheckPort }}/health; 
      do echo waiting for {{ $dep }}; 
      sleep {{ $.Values.initContainers.containers.retryInterval }}; 
      done;
{{- end }}
{{- end }}
{{- end }}