# Scripting-in-bash

## 🐚 Bash Scripting Utilities

This repository contains a small collection of Bash scripts focused on file handling, directory comparison, and basic system inspection.
All scripts are self-contained, safe to run, and documented inside their source code.

They provide small, focused command-line utilities implemented in Bash.

## 📂 Scripts included
- **doc_lowercase.sh** – Searches recursively for `.doc` and `.docx` files and renames them to lowercase to normalize filenames.

- **dir_diff.sh** – Compares two directories and prints the files that exist in one directory but not in the other.

- **even_or_odd.sh** – Checks whether a given number is even or odd.

- **interleave_files.sh** – Prints multiple files line by line (first line of all files, then second line, and so on) until the longest file is exhausted.

- **user_uid_between_limits.sh** – Lists system users whose UID is within a specified numeric range. Reads from `/etc/passwd` without modifying the system.

- **users_by_file_count.sh** – Shows users that own a number of files greater than or equal to a given threshold.

---

## ▶️ How to use
Make any script executable:
```bash
 chmod +x script_name.sh 
 ```
Run it:
```bash
 ./script_name.sh [arguments] 
 ```
Each script prints usage information when called incorrectly.

## ⚠️ Notes
- All scripts are **read-only** (they do not create, delete, or modify system files unless explicitly stated).
- Always review a script before running it on important systems.
