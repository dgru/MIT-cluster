# submits a job to cluster with the following parameters (# SBATCH defines things, doesn't comment out)

#!/bin/sh 
#SBATCH -p sched_mit_g4nier              # partition for my lab (queue) (Fournier Lab = g4nier)
#SBATCH -n 1 # of cores 
#SBATCH --mincores=4 
#SBATCH -t 0-08:00:00 # maxtime:  DAY-Hour:Min:Sec, will stop after this time!
#SBATCH -J slowLayerTest_1 # Job Name 
#SBATCH -o slowLayerTest_1.out # Job Name; outputs a test file

.  /etc/profile.d/modules.sh 			# load modules
module add engaging/muscle				# MUSCLE, used for alignment
module add engaging/RaxML/8.1.9			# RaxML, used for tree building

# launch the code  

# muscle -in inputfilename -out outputfilename 
# raxml -s inputfilename -n outputfilename -m PROTGAMMALG -p 1 
# tail -f slowLayerTest_1.out # run this line outside of script from cluster to look at output of script while its running
# squeue -u dgruen # type this line to check on if you're jobs are running or waiting to run on the queue
