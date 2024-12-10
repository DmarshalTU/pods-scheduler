# Scale down all
kubectl scale deployment --all --replicas=0 -n dev-weu

# Scale up all (simulating cluster restart)
kubectl scale deployment --all --replicas=1 -n dev-weu

# Watch the ordered startup
kubectl get pods -n dev-weu -w