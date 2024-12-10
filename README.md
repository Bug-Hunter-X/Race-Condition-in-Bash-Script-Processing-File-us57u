# Race Condition in Bash Script

This repository demonstrates a common yet subtle bug in shell scripting: race conditions. The script `bug.sh` attempts to process a file, but if the file is modified concurrently, the script might fail to process it completely or correctly, leading to data inconsistencies or errors.

The `bugSolution.sh` offers a solution by using file locking mechanisms to prevent concurrent access and ensure data integrity during processing.

## How to reproduce
1. Clone the repository.
2. Run `bug.sh`. Observe the behavior.
3. Try modifying `/tmp/data.txt` while `bug.sh` is running. This is likely to lead to errors.
4. Run `bugSolution.sh`. This version is significantly more resilient to concurrency issues.

## Solution
The solution utilizes file locking to guarantee exclusive access to the file. This prevents multiple processes or scripts from writing to or reading from the file simultaneously.