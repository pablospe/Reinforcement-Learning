#!/bin/bash

#
#	Runs an RL-Glue experiment without any RL-Viz fancies.
#


#Don't let this be too scary for you, it's not as bad as it looks.  Running an experiment consists of starting 4 different programs:
#	- RL_glue executable
#	- Environment
#	- Agent
#	- Experiment

# The fact that we're starting all 4 parts in a regular way is what makes this look complicated.  This files sources (includes)
#  /system/scripts/rl-library-includes.sh
# If you check out that file you'll see there is no magic.

#Path back to rl-library main directory from here
basePath=..
systemPath=$basePath/system
GluePath=$basePath/system/common/libs/rl-glue-java/JavaRLGlueCodec.jar

productsPath=$basePath/products

#Source a script that sets all important functions and variables
source $systemPath/scripts/rl-library-includes.sh

#Compile SampleExperiment
mkdir -p classes
javac -d classes -classpath $GluePath src/SampleExperiment.java

#Start Agent in background
java -jar $productsPath/TetrisAgentJava.jar &

#Start Environment in background
java -jar $productsPath/Tetris.jar &

startRLGlueInBackGround

java -classpath $GluePath:./classes SampleExperiment


