set -x
export INTEGRATION_DEPLOYMENT_NAME=copy-leads-to-campaign
export NEW_INTEGRATION_DEPLOYMENT_FILE=${TRAVIS_BUILD_DIR}/newDeployment.json
pwd
echo $TRAVIS_BUILD_DIR

npm install

# We start to see the JWT so lets hide it
set +x
eval `node ./scripts/appc-login.js` || exit 1

curl -X PUT  \
   "https://firefly-api-prod.appconnect.ibmcloud.com/${APP_CONNECT_INSTANCE_ID}/api/v1/integration-deployments/${INTEGRATION_DEPLOYMENT_NAME}" \
   --header "Content-Type: application/json"      \
   --header "Authorization: bearer ${APP_CONNECT_JWT}" \
    -T ${NEW_INTEGRATION_DEPLOYMENT_FILE}
