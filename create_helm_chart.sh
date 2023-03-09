#!/bin/bash
SVC_NAME=$1
CHART_NAME=$SVC_NAME'-chart'
CHART_VERSION=$2
REPO=$3
ORG_NAME=$4
DEPLOY_ENV=$5
PROJECT_NAME=$6
CHART_HOME=/opt/homebrew/bin
#echo "Creating $CHART_NAME $CHART_VERSION $REPO $ORG_NAME $DEPLOY_ENV"
#$CHART_HOME/helm create $CHART_NAME
# replace the image name by your own image name
sed -i .bak "s/repository: <repo_url>/repository: $REPO\/$ORG_NAME/g" $CHART_NAME/values.$DEPLOY_ENV.yaml
sed -i .bak "s/0.5.0/$CHART_VERSION/g" $CHART_NAME/values.$DEPLOY_ENV.yaml
sed -i .bak "s/0.5.0/$CHART_VERSION/g" $CHART_NAME/Chart.yaml
$CHART_HOME/helm template --values $CHART_NAME/values.$DEPLOY_ENV.yaml $CHART_NAME
$CHART_HOME/helm upgrade -i $CHART_NAME -f $CHART_NAME/values.$DEPLOY_ENV.yaml ./$CHART_NAME -n $PROJECT_NAME
