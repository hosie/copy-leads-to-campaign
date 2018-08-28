set -x

. ${TRAVIS_BUILD_DIR}/scripts/common.sh
export INTEGRATION_YAML_FILE="${TRAVIS_BUILD_DIR}/${FLOW_NAME}.yaml"
pwd
echo $TRAVIS_BUILD_DIR

npm install

node ${TRAVIS_BUILD_DIR}/scripts/build.js "${INTEGRATION_YAML_FILE}" ${NEW_INTEGRATION_DEPLOYMENT_FILE}
