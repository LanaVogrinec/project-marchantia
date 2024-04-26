# Snakemake workflow: `marchantia-project`

[![Snakemake](https://img.shields.io/badge/snakemake-≥6.3.0-brightgreen.svg)](https://snakemake.github.io)
[![GitHub actions status](https://github.com/nezapajek/tobamo-project/workflows/Tests/badge.svg?branch=main)](https://github.com/nezapajek/tobamo-project/actions?query=branch%3Amain+workflow%3ATests)


A Snakemake workflow for searching for DNA viruses of Marchantia polymorpha.

## Usage

The usage of this workflow is described in the [Snakemake Workflow Catalog](https://snakemake.github.io/snakemake-workflow-catalog/?usage=nezapajek%2Ftobamo-project).

If you use this workflow in a paper, don't forget to give credits to the authors by citing the URL of this (original) repository.

## Workflow

1. Quality control and adapter trimming with [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)
2. De Novo Assembly with [megahit](https://www.metagenomics.wiki/tools/assembly/megahit) and [SPAdes](https://cab.spbu.ru/software/spades/)
3. Search for similarity against non-redundant (NR) protein database with [Diamond](https://bio.tools/diamond) blastx
4. Assigning taxonomy with [Megan6](https://www.computomics.com/services/megan6.html)

[![Code style: snakefmt](https://img.shields.io/badge/code%20style-snakefmt-000000.svg)](https://github.com/snakemake/snakefmt)
