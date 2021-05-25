#!/bin/bash
#SBATCH -A <allocationID>
#SBATCH --partition=<queueName>
#SBATCH --time=<hh:mm:ss> 
#SBATCH --mail-user=<emailAddress>
#SBATCH --output=<combined out and err file path>
#SBATCH -J <jobName>
#SBATCH --nodes=1
#SBATCH -n <number of cores>
#SBATCH --mem=<number of GB>G  # Total memory in GB needed for a job. Also see --mem-per-cpu

# unload modules that may have been loaded when job was submitted
module purge all

module load knitro/10.3
# You don't have to use python. KNITRO has interface for other programing languages. 
module load python/anaconda3.6
# Make sure that knitro is loaded before python.
# Make sure that the file knitro.py is in the working directory.

# By default all file paths are relative to the directory where you submitted the job.
# To change to another path, use `cd <path>`, for example:
# cd /projects/<allocationID>

# exampleHS15.py is your script.  If it's not in the working directory set above, add 
# the full or relative path as appropriate
python exampleHS15.py
# Output will be in the output file path in the working directory.
# If not specified, the output file path will be "slurm_<jobID>.out".

# From the command line, in the directory with this file, submit this job with:
# sbatch <filename>.sh
