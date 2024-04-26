rule diamond:
    input:
<<<<<<< HEAD
        "results/{biosample_ID}/02_{biosample_ID}_megahit_contigs.fasta",
    output:
        "results/{biosample_ID}/03_{biosample_ID}_megahit_diamond.daa",
    log:
        logO="logs/diamond/{biosample_ID}.log",
        logE="logs/diamond/{biosample_ID}.err.log",
    benchmark:
        "results/{biosample_ID}/03_{biosample_ID}_benchmark_megahit_diamond.txt",
    conda:
        "../envs/diamond-megan.yaml"
    threads: 60
    shell:
        """
        diamond blastx --threads {threads} -d /DATA/PHEW/databases/diamond_20240405_v.0.9.14/nr.dmnd -k 20 -q {input} --daa {output} > {log.logO} 2> {log.logE}
=======
        "results/{accession}/02_{accession}_megahit_contigs.fasta",
    output:
        "results/{accession}/03_{accession}_megahit_diamond.daa",
    log:
        logO="logs/diamond/{accession}.log",
        logE="logs/diamond/{accession}.err.log",
    benchmark:
        "results/{accession}/03_{accession}_benchmark_megahit_diamond.txt",
    conda:
        "../envs/diamond_env.yaml"
    threads: 60
    shell:
        """
<<<<<<< HEAD
        diamond blastx --threads {threads} -d /DATA/PHEW/databases/diamond_20240703/nr.dmnd -k 20 -q {input} --daa {output} > {log.logO} 2> {log.logE}
>>>>>>> edec49089aa13d94fd104b786797fb906496cb3c
        """
=======
        diamond view --daa {input.d} --outfmt 6 > {output.info}
        python workflow/scripts/select_contigs.py {input.f} {output.info} {output.selected} > {log.logO} 2> {log.logE}
        if [ -s {output.info} ]; then
            diamond blastx -d resources/nr.dmnd -q {output.selected} --threads 10 -k 20 --unal 1 --daa {output.out} >> {log.logO} 2>> {log.logE}
        else
            cp -f {input.d} {output.out}
        fi
        """


rule diamond_nr_get_info:
    input:
        "results/{accession}/06_{accession}_diamond_nr.daa",
    output:
        "results/{accession}/06_{accession}_diamond_nr_info.tsv",
    log:
        logO="logs/diamond_nr/{accession}_info.log",
        logE="logs/diamond_nr/{accession}_info.err.log",
    conda:
        "../envs/diamond-megan.yaml"
    threads: 2
    shell:
        """
        diamond view --daa {input} --outfmt 6 > {output}
        """
>>>>>>> fbb2e877af4b2d2e661c6f44e4a6c0bd35258f74
