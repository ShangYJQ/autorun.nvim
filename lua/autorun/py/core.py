import subprocess
import sys
import os
import time


def clear_terminal():
    print("\033c", end="")


def del_file(filename):
    os.remove(filename)


def compile_code(cmd):
    clear_terminal()
    compile_process = subprocess.run(cmd, capture_output=True)
    if compile_process.returncode != 0:
        print("Compile erroe")
        print(compile_process.stderr.decode())
        sys.exit(1)
    print("Compile success")
    print(compile_process.stdout.decode())
    input("Enter any key to continue...")


def run_exec_file(filename, interpreter="f"):
    clear_terminal()
    print("Start running...")

    start_time = time.time()

    if interpreter == "f":
        run_command = ["./" + filename]
    else:
        run_command = [interpreter, filename]

    run_process = subprocess.run(run_command)

    end_time = time.time()

    if run_process.returncode != 0:
        print("\nRun error")
        print(run_process.stderr.decode())
        sys.exit(1)

    print("\nRun finish")

    elapsed_time = (end_time - start_time) * 1000  # 转换为毫秒
    print(f"Run time: {elapsed_time:.3f} ms")


def exit():
    sys.exit(0)
