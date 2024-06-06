## Clear pip Cache Correctly

```sh
pip cache purge
```

## Creation of virtual environments

```sh
python -m venv .venv
# activate new environment
.\.venv\Scripts\Activate.ps1
```

## Instal packaged

```sh
pip install -r requirements.txt
```

## Generating a requirements.txt file

```sh
pip3 freeze > requirements.txt  # Python3
pip freeze > requirements.txt  # Python2
```
