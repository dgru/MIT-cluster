#!/bin/bash

#'SLURM directives'
#SBATCH -p sched_mit_g4nier				# partition (queue) (Fournier Lab is "g4nier")
#SBATCH -N 1  						        # machines
#SBATCH -n 1 						          # of tasks 
#SBATCH --cpus-per-task=20				# CPUs per task
#SBATCH --mem=32000					      # 1000 is default
#SBATCH -t 0-08:00:00 					  # maxtime:  DAY-Hour:Min:Sec, will stop after this time!
#SBATCH -J prottest_DSG 					# Job Name (change this for your run)
#SBATCH -o prottest_DSG.out 			# Job Name; outputs a test file (change this for your run)

# module setup
.  /etc/profile.d/modules.sh 				      # load modules
module add engaging/prottest/3.4.2				# Prottest, Determine the best fitting amino acid substitution model for a given alignment, tree topology optional (uses NJ tree by default).

# launch code  (insert science here)
cd $PROTTEST_HOME	                                              # have to CD to prottest, not loaded
./prottest3 -i /home/dgruen/Sh_mtaC_700archhits_Muscle.fasta -+F T -+I T -+I+G T -+G T
	# -i for input alignment file; make sure you navigate to path
	# [addon]: T/F (true or false) see manual pg 5

# to submit: sbatch submit_prottest.sh
