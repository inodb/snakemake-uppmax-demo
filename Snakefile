import os

OUTPUT=os.environ.get("OUTPUT", " ".join(map("test{0}.txt".format, range(10)))).split()

MULTIOUTPUT1 = "multioutput0.txt"
MULTIOUTPUT2 = "multioutput1.txt"

rule all:
    input: OUTPUT, MULTIOUTPUT1, MULTIOUTPUT2

rule echotest:
    output: "test{number}.txt"
    shell: "echo test{wildcards.number} > {output}"

rule multi_in_out:
    input: OUTPUT
    output: MULTIOUTPUT1, MULTIOUTPUT2
    run:
        shell("cat {input[0]} > {output[0]}")
        shell("cat {inputrest} > {output[1]}".format(inputrest=" ".join(OUTPUT[1:]), output=output))

rule clean:
    run:
        shell("rm -f " + " ".join(OUTPUT))
        shell("rm -f " + MULTIOUTPUT1)
        shell("rm -f " + MULTIOUTPUT2)
