export FLOW_NAME="Populate a Salesforce campaign with leads captured in IBM Db2"
export NEW_INTEGRATION_DEPLOYMENT_FILE=${TRAVIS_BUILD_DIR}/build-output.json
export INTEGRATION_DEPLOYMENT_NAME=$( echo  ${FLOW_NAME} | sed "s/ /-/g" )
