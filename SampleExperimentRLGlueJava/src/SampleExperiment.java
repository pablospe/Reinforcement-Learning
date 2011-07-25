/*
Copyright 2007 Brian Tanner
brian@tannerpages.com
http://brian.tannerpages.com

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/
import org.rlcommunity.rlglue.codec.RLGlue;
import org.rlcommunity.rlglue.codec.types.*;
import java.io.IOException;

public class SampleExperiment
{
	protected static final int kNumEpisodes = 10;
	protected static int rlNumSteps[];
	protected static double rlReturn[];
	
	//cutoff
	protected static int maxStepsPerEpisode=10000;
	

	protected static void run(int numEpisodes) throws IOException
	{
		/*run for num_episode number of episodes and store the number of steps and return from each episode*/        	
		for(int x = 0; x < numEpisodes; ++x) {
			System.out.print("Episode: "+(x+1));
			RLGlue.RL_episode(maxStepsPerEpisode);
			System.out.println("\t steps: "+RLGlue.RL_num_steps()); 
			rlNumSteps[x] = RLGlue.RL_num_steps();
			rlReturn[x] = RLGlue.RL_return();
		}
	}

	public static void main(String [] args) throws IOException {
		double avgSteps = 0.0;
		double avgReturn = 0.0;

		rlNumSteps = new int[SampleExperiment.kNumEpisodes];
		rlReturn = new double[SampleExperiment.kNumEpisodes];

		RLGlue.RL_init();

		System.out.println("Running: "+kNumEpisodes+" with a cutoff each of: "+maxStepsPerEpisode+" steps.");
		
		run(kNumEpisodes);
		RLGlue.RL_cleanup();
		
		/*add up all the steps and all the returns*/
		for (int i = 0; i < SampleExperiment.kNumEpisodes; ++i) {
		    avgSteps += rlNumSteps[i];
		    avgReturn += rlReturn[i];
		}
		
		/*average steps and returns*/
		avgSteps /= (double)SampleExperiment.kNumEpisodes;
		avgReturn /= (double)SampleExperiment.kNumEpisodes;
		
		/*print out results*/
		System.out.println("\n-----------------------------------------------\n");
		System.out.println("Number of episodes: " + SampleExperiment.kNumEpisodes);
		System.out.println("Average number of steps per episode: " +  avgSteps);
		System.out.println("Average return per episode: " + avgReturn);
		System.out.println("-----------------------------------------------\n");
	}   
}
