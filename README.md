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

Allows programmatic table creation in IPython Notebooks.
```python
from IPython.core.display import display, HTML

def show_notebook_table(header,table):
    """Takes a heading list, and a list of lists for data."""
    html="<table>"
    html+="<thead><tr>"
    assert len(header)==len(table[0])
    for column in header:
        html+="<th>"+str(column)+"</th>"
    html+="</tr></thead>"
    for row in table:
        html+="<tr>"
        for column in row:
            html+="<td>"+str(column)+"</td>"
        html+="</tr>"
    html+="</table>"
    display(HTML(html))
```

# R

*coming soon*

# Contact

[Feel free to message me on FB!](https://www.facebook.com/realMingChia/)
