# Python

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

[see movie.R for code to run dynamic dendrogram animation](movie.R)

# Contact

[Feel free to message me on FB!](https://www.facebook.com/realMingChia/)
