#!/bin/bash

#
#	Runs an RL-Viz App Experiment
#


#Don't let this be too scary for you, it's not as bad as it looks.  Running an experiment consists of starting 4 different programs:
#	- RL_glue executable
#	- EnvironmentShell -- looks for environments in JAR files wherever you tell it to
#	- AgentShell  -- looks for agents in JAR files wherever you tell it to
#	- RLVizApp  -- application that runs a graphically driven experiment


 
# The fact that we're starting all 4 parts in a regular way is what makes this look complicated.  This files sources (includes)
#  /system/scripts/rl-library-includes.sh
# If you check out that file you'll see there is no magic.
# We just use the scripts instead of invokings things manually so the script can sometimes take care of 
# platform specific idiosyncracies (like Cygwin stuff).

#We'll actually provide the Linux invokations in Linux, so you can not use the script if you want.

#Path back to rl-library main directory from here
basePath=..
systemPath=$basePath/system

productsPath=$basePath/products
#Source a script that sets all important functions and variables
source $systemPath/scripts/rl-library-includes.sh

#Linux command to start RL_glue
#rl_glue &
startRLGlueInBackGround

#Linux Command for EnvironmentShell
#java -ea -Xmx128M -jar $systemPath/common/libs/rl-viz/EnvironmentShell.jar environment-jar-path=$productsPath &
startEnvShellInBackGround

#Linux Command for AgentShell
#java -ea -Xmx128M -jar $systemPath/common/libs/rl-viz/AgentShell.jar agent-jar-path=$productsPath &
startAgentShellInBackGround

#Linux Command to Start RLVizApp
#agent-environment-jar-path might look out of place because we are starting agentShell and environmetShell separately
#but actually, the use of the variable here is so the VizApp knows where to find visualizers
java -ea -Xmx128M -jar  $systemPath/common/libs/rl-viz/RLVizApp.jar list-agents=true list-environments=true env-viz=true agent-viz=true agent-environment-jar-path=$productsPath
#startNetGuiTrainerDynamicEnvAgentBothViz

waitForAgentShellToDie
waitForEnvShellToDie
waitForRLGlueToDie

