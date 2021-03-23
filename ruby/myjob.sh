#!/bin/bash
#SBATCH -A <allocationID>
#SBATCH --partition=<queueName>
#SBATCH --time=<hhh:mm:ss> 
#SBATCH --mail-user=<emailAddress>
#SBATCH --output=<combined out and err file path>
#SBATCH -J <jobName>
#SBATCH --nodes=1
#SBATCH -n 4 # Stata-MP has a 4 core license.
#SBATCH --mem=12G  # Total memory in GB needed for a job. Also see --mem-per-cpu

# unload modules that may have been loaded when job was submitted
module purge all

module load ruby

# By default all file paths are relative to the directory where you submitted the job.
# To change to another path, use `cd <path>`, for example:
# cd /projects/<allocationID>

# mycode.rb is your Ruby script.  If it's not in the working directory set above, add 
# the full or relative path as appropriate
ruby mycode.rb 
# Ruby output will be in the output file path in the working directory.
# If not specified, the output file path will be "slurm_<jobID>.out".

# From the command line, in the directory with this file, submit this job with:
# sbatch myjob.sh
