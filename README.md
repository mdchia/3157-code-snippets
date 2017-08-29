# Python

A fasta file parser
```python
def fasta_read(fn):
    """Reads fasta file, returns as list of [sequence label, sequence]"""
    lines=open(fn)
    seqs = [] # holds all the sequences, with labels
    seq = [] # temporary cache for sequences
    for line in lines:
        if line[0]==">":
            if seq!=[]:
                seqs.append([seqname,''.join(seq)])
                seq = []
            seqname=line[1:].strip()
        else:
            seq.append(line.strip())
    seqs.append([seqname,''.join(seq)])
    lines.close()
    return seqs
```

# R

*work in progress*

# Contact

[Feel free to message me on FB!](https://www.facebook.com/realMingChia/)
