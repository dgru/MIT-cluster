#!/bin/bash						


#'SLURM directives' go here ("sbatch___" defines setup options, is not just a comment), see "man sbatch" for additional options
#SBATCH -p sched_mit_g4nier				# partition (queue) (Fournier Lab is "g4nier")
#SBATCH -N 1  							# machines
#SBATCH -n 1 							# of tasks 
#SBATCH --cpus-per-task=20				# CPUs per task
#SBATCH --mem=32000						# 1000 is default
#SBATCH -t 5-00:00:00 					# maxtime:  DAY-Hour:Min:Sec, will stop after this time!
#SBATCH -J phylobayes_DSG 				# Job Name (change this for your run)
#SBATCH -o phylobayes_DSG.out 			# Job Name; outputs a test file (change this for your run)


# module setup
.  /etc/profile.d/modules.sh 			# load modules
module add engaging/phylobayes/4.1c		# phylobayes, used for making trees / molec clocks
				

# launch code  (insert science here)
# pb -d (datafile.phy) -T (constrainttreefile.tre) -catfix C20 -rp (mean) (sd) -cal (calibrationfile.txt) -ugam -nchain 2 100 .3 50 (outfile)
pb -d alignmentfile.phy -T RAxML_bipartitions.acka_pta_speciestree_0811_17_CC_rooted -catfix C20 -ugam -nchain 2 100 .3 50 outfile_phylotest
	# -datafile is alignmentfile
	# -catfix is a module C20 is good for us
	# -rp dont put if you dont have?
	# -cal file if you have calibration points - a list
	# must be phylip file


# additional notes
# to run this job submission script type "sbatch submit_phylobayes.sh" 
