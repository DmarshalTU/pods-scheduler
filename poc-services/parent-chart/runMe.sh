# Build dependencies
helm dependency build

# Install the chart
helm install poc .  -n dev-weu

# Watch the pods come up in order
kubectl get pods -n dev-weu -w