Pipeline-demo-chart

For the new project, please generate the new sealed secret by using below command in order to create the private key on the project.

oc create secret generic user-service-chart-secret -n pipeline-demo-<env> --from-literal=db_user=<db_user> --from-literal=db_passwd=<db_passwd> --dry-run=client -o yaml | kubeseal -o yaml >user-service-chart-secret-<env>.yaml
