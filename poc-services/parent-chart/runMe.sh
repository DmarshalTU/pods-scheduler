# Build dependencies
helm dependency build

# Install the chart
helm install poc .  -n denis-test

# Watch the pods come up in order
kubectl get pods -n denis-test -w