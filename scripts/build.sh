set -x
export INTEGRATION_DEPLOYMENT_NAME=copy-leads-to-campaign
export NEW_INTEGRATION_DEPLOYMENT_FILE=${TRAVIS_BUILD_DIR}/newDeployment.json
export INTEGRATION_YAML_FILE=${TRAVIS_BUILD_DIR}/Copy\ Leads\ to\ Campaign.yaml
pwd
echo $TRAVIS_BUILD_DIR

npm install

node ${TRAVIS_BUILD_DIR}/scripts/build.js ${INTEGRATION_YAML_FILE} ${INTEGRATION_DEPLOYMENT_NAME}
