# Build dependencies
cd poc-services/parent-chart
helm dependency build

# Install the chart
helm install poc ./parent-chart -n dev-weu

# Watch the pods come up in order
kubectl get pods -n dev-weu -w