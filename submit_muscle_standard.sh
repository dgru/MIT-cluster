#!/bin/bash						# line interpreter, better than using sh, some slight nuance

#SLURM directives go here ("sbatch___" defines setup options, is not just a comment), see "man sbatch" for additional options
#SBATCH -p sched_mit_g4nier				# partition (queue) (Fournier Lab is "g4nier")
#SBATCH -N 1  						# machines
#SBATCH -n 1 						# of tasks 
#SBATCH --cpus-per-task=20				# CPUs per task
#SBATCH --mem=32000					# 1000 is default
#SBATCH -t 0-08:00:00 					# maxtime:  DAY-Hour:Min:Sec, will stop after this time!
#SBATCH -J raxml_DSG 					# Job Name (change this for your run)
#SBATCH -o raxml_DSG.out 				# Job Name; outputs a test file (change this for your run)

# module setup
.  /etc/profile.d/modules.sh 				# load modules
module add engaging/muscle				# muscle, used for aligning the output of BLAST/fasta files
							# you can load additional modules here, e.g. RAxML, or just submit a job to run muscle

# launch code  (insert science here)
muscle -in inputfilename -out outputfilename
	# don't have to specify outputname extension 
	

# additional notes
# to run this job submission script type "sbatch submit_raxml.sh" (or whatever you name the file)
# tail -f raxml_DSG.out 				# run this line outside of script from cluster to look at output of script while its running
# squeue -u dgruen 					# type this line to check on if your jobs are running or waiting to run on the queue (use your username)
