# On LLM Prompt Engineering for Hardware Design
## Overview

We are conducting a comprehensive evaluation of state-of-the-art prompt engineering techniques in the context of hardware design, with a specific focus on generating functional Verilog. 

## Problem Categorization

We categorize Verilog problems and investigate the performance of the prompting frameworks across the following categories:

- **Basic Combinational Logic**
- **Arithmetic and Data Operations**
- **Sequential Logic and Finite State Machines**
## Dataset

We combine **RTLLM** [2] and **HDL Bits** [1] datasets for our evaluation.

## Setup

### Prerequisites

- Python 3.10 or newer
- `pip` for installing dependencies
- [Icarus Verilog](https://github.com/steveicarus/iverilog)

### Installation

1.  Clone the repository to your local machine:
```sh
git clone
cd 
```

2.  Set up a virtual environment:
```sh
python3 -m venv venv
source venv/bin/activate
```
3.  Install the required python packages:
```sh
pip3 install -r requirements.txt
```

### Environment Variable
API Key (Must be set for the models being used):
 - OpenAI API Key: `OPENAI_API_KEY`

### Reproducing the results 

To evaluate the frameworks, run the command below:
```console
$ python stats.py <framework name> <model name>
```

Different Frameoworks: 
- Zero-shot
- CoT
- Generate Knowledge
- Least-to-most
- RaR 
- RoEm
- Self-ask
- Self-calibration
- Self-consistency

Different Models:
- GPT-4omini
- GPT-4o
- o3-mini

## References

[1] HDLBits: Digital Design Problems. Available: [https://hdlbits.01xz.net/](https://hdlbits.01xz.net/) (Accessed: Aug. 28, 2024).

[2] Chen, et al., "RTLLM: An Open-Source Benchmark for Design RTL Generation with Large Language Models," *arXiv preprint arXiv:2308.05345*, 2024. Available: [https://arxiv.org/abs/2308.05345](https://arxiv.org/abs/2308.05345).
