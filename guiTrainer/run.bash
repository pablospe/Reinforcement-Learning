#!/bin/bash
basePath=..
systemPath=$basePath/system

productsPath=$basePath/products
#Source a script that sets all important functions and variables
source $systemPath/scripts/rl-library-includes.sh

startRLGlueInBackGround
startEnvShellInBackGround
startNetGuiTrainerDynamicEnvironmentStandardAgent

waitForEnvShellToDie
waitForRLGlueToDie
