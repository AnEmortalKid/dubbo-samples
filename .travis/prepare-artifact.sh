#! /usr/bin/env bash
env

if [[ -z "${RELEASE_BRANCH}" ]]; then
  export INTERGARTION_TEST_VERSION=2.7.7-SNAPSHOT
else
  git clone https://github.com/apache/dubbo.git
  cd dubbo
  echo "dubbo checkout revert_5710"
  git checkout revert_5710
  ls
  ./mvnw clean install -DskipTests -Drevision=${RELEASE_BRANCH}
  export INTERGARTION_TEST_VERSION=${RELEASE_BRANCH}
  cd ..
fi

env|grep INTERGARTION_TEST_VERSION
