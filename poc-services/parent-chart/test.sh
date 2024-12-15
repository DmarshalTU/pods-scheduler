# Scale down all
kubectl scale deployment --all --replicas=0 -n denis-test

# Scale up all (simulating cluster restart)
kubectl scale deployment --all --replicas=1 -n denis-test

# Watch the ordered startup
kubectl get pods -n denis-test -w