all:
	cd RandomAgentJava && ant build
	cd TetrisAgentJava && ant build
	cd TetrisEnvJava && ant build
	cd SampleExperimentRLVizAppJava && bash run.bash



clean:
	cd RandomAgentJava && ant clean
	cd TetrisAgentJava && ant clean
	cd TetrisEnvJava && ant clean
