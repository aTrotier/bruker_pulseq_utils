# bruker_pulseq_utils

This folder contains :
- Python script to generate pulseq sequences for Bruker scanners
- Reconstruction scripts for the generated data

The sequences are used to test the bruker pulseq interpreter : https://github.com/mdbudde/bruker_pulseq_private
The repository is in private. You should ask [@mdbudde](https://github.com/mdbudde) to get access to it 

# Setups
## Requirements
- conda

## Conda environment
```
run(`conda create -n pulseq_env python=3.10`)
conda activate pulseq_env
pip install pypulseq
pip install ipykernel # for jupyter notebook
```

# Checks to do
- check the hardware configuration on our scanner
- 