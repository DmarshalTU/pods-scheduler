$namespace = "dev-weu"
kubectl scale --replicas=0 deployment --all -n dev-weu

kubectl scale --replicas=1 deployment ums-service -n $namespace 
sleep 250
kubectl scale --replicas=1 deployment ocs-service -n $namespace 
sleep 70
kubectl scale --replicas=1 deployment uss-service -n $namespace 
sleep 70
kubectl scale --replicas=1 deployment oms-service -n $namespace 
sleep 70
kubectl scale --replicas=1 deployment sms-service -n $namespace 
sleep 70

$excludeDeployments = @("ums-service", "ocs-service", "uss-service", "oms-service") 
$deployments = kubectl get deployments -n $namespace --no-headers -o custom-columns=":metadata.name" 
foreach ($deployment in $deployments) {   	
	if ($excludeDeployments -notcontains $deployment) {    	
		kubectl scale --replicas=1 deployment $deployment -n $namespace    
} }