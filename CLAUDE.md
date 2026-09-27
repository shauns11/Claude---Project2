# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

Execute R scripts from Visual Studio Code, with logging and timestamping. Scripts read statistical data files (SAS/SPSS/Stata) via the `haven` package.

## File Paths

- Working directory: `C:\CLAUDE\Projects\Project2`
- R executable path: `C:\Program Files (x86)\R\R-4.6.1\bin\Rscript.exe`
- R scripts: `code\`
- Output files (logs, tables, figures): `output\`
- Datasets: `data\`

## Running R Scripts

Run all scripts in order:

```powershell
Get-ChildItem "code\*.r" | Sort-Object Name | ForEach-Object { Rscript $_.FullName }
```

To run a single script:

```powershell
Rscript "code\01.R_commands.r"
```

## R Script Template

```r
# Libraries
library(haven)

# Commands
# ... analysis code ...

# Timestamp
print(Sys.time())
```

## R Conventions

- Name scripts with a numeric prefix: `01.description.r`, `02.description.r`, etc.
- Scripts run sequentially; numbering reflects execution order.
- Output files (logs, tables, figures) go to `output\`.
- Datasets go to `data\`.
- `haven` is the standard package for loading `.sas7bdat`, `.sav`, and `.dta` files.

## Git and GitHub

Remote: `https://github.com/shauns11/Claude---Project2.git` (branch `main`). The GitHub CLI (`gh`) is not installed, so use plain `git` and the GitHub website.

### First-time setup (new project)

1. Create `.gitignore` in the project root **before** the first commit, so ignored files are never committed:

```text
# Stata datasets (anywhere in the project)
*.dta
# R datasets (anywhere in the project)
*.rds
# log files (anywhere in the project)
*.txt
```

2. Initialise the repository, check what will and won't be committed, then commit:

```powershell
git init -b main
git add .
git status --short             # files to be committed
git status --short --ignored   # lines starting "!!" are ignored (e.g. 01.log)
git commit -m "Initial commit"
```

3. I will create an **empty** repository on github.com (no README, .gitignore or licence) and choose Public or Private.
4. Before pushing, confirm the remote exists and is empty. `git ls-remote` returns nothing for an empty repo and "Repository not found" if the URL is wrong, deleted or private without access:

```powershell
git ls-remote https://github.com/shauns11/Claude---Project2.git
```

5. Add the remote and push `main`:

```powershell
git remote add origin https://github.com/shauns11/Claude---Project2.git
git push -u origin main
git status -sb                 # should show: ## main...origin/main
```

6. Update the `Remote:` line at the top of this section.

Notes:
- Never use `git push --force` against a repository that already has history unless you intend to permanently replace it.
- Warnings like "LF will be replaced by CRLF" are Windows line-ending notices and can be ignored.

### Day-to-day

```powershell
git status                 # see what changed
git add .                  # stage changes
git commit -m "Message"    # commit
git push                   # upload to GitHub
```

### What is tracked

- Tracked: `code\` (R-scripts), `output\` (logs, tables, figures), `CLAUDE.md`, `.gitignore`
- Ignored (see `.gitignore`):
  - `*.rds` — R datasets, anywhere in the project


