# bruker_pulseq_utils

**WIP : don't use the sequence on your scanner for now**

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
pip install ipykernel # for jupyter notebook
```
Currently bruker interpreter only works with pulseq >1.5.0 which is in dev on pypulseq. You can install it with the following commands :

```
pip install git+https://github.com/imr-framework/pypulseq@v1.5.0_dev
```

# Checks to do
- check the hardware configuration on our scanner