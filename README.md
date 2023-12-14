IGMC -- Inductive Graph-based Matrix Completion
===============================================================================

Requirements
------------

This project was run with the following combination: Python 3.10 + PyTorch 2.0.1 + PyTorch_Geometric 2.4.0. 

We can create a conda environment containing all necessary dependencies as follows:

    conda create python=3.10
    pip install torch=2.0.1
    pip install torch_geometric=2.4.0
    pip install pandas
    pip install h5py
    pip install matplotlib

Usages
------

### Douban

To train and test on Douban, type:

    python Main.py --data-name douban --epochs 40 --testing --ensemble

### MovieLens-100K

To train on MovieLens-100K, type:

    python Main.py --data-name ml_100k --save-appendix _mnph200 --data-appendix _mnph200 --epochs 40 --max-nodes-per-hop 20 --testing --ensemble --dynamic-train

where the --max-nodes-per-hop argument specifies the maximum number of neighbors to sample for each node during the enclosing subgraph extraction, whose purpose is to limit the subgraph size to accomodate large datasets.

The --ARR flag controls whether or not to use TARR. By default, the lambda for TARR is set to 0.001. This can be adjusted with this flag, or turned off with the argument --ARR 0.

The scripts to run all of these commands three times, with the appropriate seeds, can be found in this repository.
