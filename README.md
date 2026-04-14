# Find-keywords.sh

Scans all `.sh` files in `sh-files/` modified within the last 30 days, reports every line containing `read` or `echo`, and shows how many times each word occurs and writes to a .txt file.

## Requirements

- bash 3.2+
- `find`, `grep` (standard on Ubuntu/WSL)

## Usage

```bash
bash scripts/find-keywords.sh
```

## What it does

- Finds all `*.sh` files in `~/sh-files/` modified in the last 30 days
- For each file, searches for occurrences of `echo` and `read`
- Counts how many times each keyword appears per file
- Prints a warning in the terminal if a keyword appears more than 2 times in a file
- Saves all results to `~/sh-files/sh_analysis_report.txt`
## Notes

> The report is saved to `/home/karolin/sh-files/sh_analysis_report.txt` and overwritten on each run.
> A warning is printed to the terminal if `echo` or `read` appears more than 2 times in a single file.

## Environment

Developed and tested on Ubuntu (WSL).

