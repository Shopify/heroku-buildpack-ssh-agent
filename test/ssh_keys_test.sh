#! /bin/sh
. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh


testSSHKeysDroppedOnDiskForGITHUB_DEPLOY_KEY()
{
  cp ${BUILDPACK_HOME}/test/id_rsa ${ENV_DIR}/GITHUB_DEPLOY_KEY
  compile
  assertCapturedSuccess
  assertFileMD5 "b8e9a7bae8195a8812108a0a053e2918" ${BUILD_DIR}/.ssh/id_rsa
}

testSSHKeysDroppedOnDiskForSSH_KEY()
{
  cp ${BUILDPACK_HOME}/test/id_rsa ${ENV_DIR}/SSH_KEY
  compile
  assertCapturedSuccess
  assertFileMD5 "b8e9a7bae8195a8812108a0a053e2918" ${BUILD_DIR}/.ssh/id_rsa
}

testssh_agentStartScriptAdded()
{
  cp ${BUILDPACK_HOME}/test/id_rsa ${ENV_DIR}/SSH_KEY
  compile
  assertCapturedSuccess
  assertTrue "[ -e ${BUILD_DIR}/.profile.d/launch_ssh_agent.sh ]"
}
