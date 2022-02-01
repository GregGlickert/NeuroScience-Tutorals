# HPC tutorials
## To build the network first make sure your enviorment is activate.
Then run the command
```
sbatch batch_build.sh
```
This will build the network and send an email saying the network is build. MAKE SURE TO CHANGE TO EMAIL IN THE BATCH FILES SO I DON'T GET A BUNCH OF EMAILS. To change the email edit the batch files using VIM. <br/>Then to run the network using multiple cores use the batch run file
```
sbatch batch_run.sh
```
