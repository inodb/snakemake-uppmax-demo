snakemake-uppmax-demo
=====================

Demonstrates the use of snakemake compared to GNU make on Uppmax with a simple
example. The Makefile and Snakefile both create files test{0..9}.txt with the
corresponding number echoed to to the file. Then the files multioutput{0,1}.txt
are created which are respectively a copy of the first file and a concatenation
of the other files to demonstrate a multi input and multi output rule. The
snakemake rules can be individually clustered with snakemake --cluster
./Snakefile-sbatch. Snakemake generates a bash script for each rule which can
then be scheduled with sbatch. First couple of lines hold rule name info and
input/output so you can specify resource usage based on input file sizes and
the rule name.

For a more elaborate explanation of snakemake:
https://code.google.com/p/snakemake/wiki/Documentation
