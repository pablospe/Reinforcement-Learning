#summary This is the page for download information and details about the Java RL-Glue Sample Experiment Domain, Version: r1068.
#labels Language-Java,Type-Experiment,Page-Download
#sidebar Downloads

<wiki:comment>
This README.txt is also the Wiki page that is hosted online at:
Experiment

So, it is in Wiki Syntax.  It's still pretty easy to read.
</wiki:comment>

<wiki:toc />


= RL-Library Java Version of RL-Glue Sample Experiment =

For full details, please visit:
[http://code.google.com/p/rl-library/wiki/SampleExperimentRLGlueJava]

Download Link: [http://rl-library.googlecode.com/files/SampleExperimentRLGlue-Java-R1068.tar.gz SampleExperimentRLGlue-Java-R1068.tar.gz] [http://code.google.com/p/rl-library/downloads/detail?name=SampleExperimentRLGlue-Java-R1068.tar.gz (Details)]

This project is licensed under the Apache 2.0 License.
See LICENSE.txt for details.


== Note :: You need Mountain Car and Random Agent to run this Experiment ==
For this experiment to work properly, you must have the [MountainCarJava] and [RandomAgentJava] 
projects downloaded and installed into your `rl-library/products` directory.  

This experiment is actually part of the [GettingStarted getting started guide], so please consult that document for full 
details and explanation.

== Using This Download ==
Before diving into this, you may want to check out [GettingStarted the getting started guide].

This download can be used to augment your existing local RL-Library (if you have one), or as the basis to start a new one.

=== This Is Your First Project ===
{{{
#Create a directory for your rl-library. Call it whatever you like.
mkdir rl-library
}}}
That's all you have to do special for the *first time* you download a rl-library component.  Continue on now
to the next section.

=== Adding To An Existing RL-Library Download ===

{{{
#First, download the file.  Depending on your platform, you might have to do this manually with a web browser. 

#If you are on Linux, you can use wget which will download SampleExperimentRLGlue-Java-R1068.tar.gz for you
wget http://rl-library.googlecode.com/files/SampleExperimentRLGlue-Java-R1068.tar.gz

#Copy the download to your local rl-library folder (whatever it is called)
cp SampleExperimentRLGlue-Java-R1068.tar.gz rl-library/
cd rl-library

#This will add any project-specific things necessary to system and products folders
#It will also create a folder for this particular project
tar -zxf SampleExperimentRLGlue-Java-R1068.tar.gz

#Clean up
rm SampleExperimentRLGlue-Java-R1068.tar.gz
}}}

== Running This Experiment ==
This experiment will automatically recompile itself each time you run it. 

To run it, simple execute the `run.bash` script that was bunded with the project.

{{{
>$ cd SampleExperimentRLGlue-Java-R1068
>$ bash run.bash

}}}

This will start up the agent, environment, and experiment program needed to run this example, and will also start the rl_glue executable socket server if necessary.


== Getting Help ==
Please send all questions to either the current maintainer (below) or to the 
[http://groups.google.com/group/rl-library RL-Library mailing list].


== Authors ==
 * [http://research.tannerpages.com Brian Tanner]

=== Current Maintainer ===
 * [http://research.tannerpages.com Brian Tanner]
 * btanner@rl-community.org
 * [http://research.tannerpages.com]




