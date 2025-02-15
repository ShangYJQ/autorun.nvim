import subprocess
import sys
import os
import time


def clear_terminal():
    print("\033c", end="")


def del_file(filename):
    try:
        print("Removing tmp file...")
        os.remove(filename)
    except OSError as e:
        print(f"Remove error: {e}")


def error_exiting():
    print("Exiting...")
    sys.exit(1)


def compile_code(cmd):
    clear_terminal()
    print("Compiling...")
    compile_process = subprocess.run(cmd, capture_output=True)
    if compile_process.returncode != 0:
        print("Compile error")
        print(compile_process.stderr.decode())
        error_exiting()
    print("Compile success")
    print(compile_process.stdout.decode())
    input("Enter any char to continue...")


def run_exec_file(filename, interpreter="f"):
    clear_terminal()

    if interpreter == "f":
        run_command = ["./" + filename]
    else:
        run_command = [interpreter, filename]

    print("========Running========\n")

    start_time = time.time()

    run_process = subprocess.run(run_command)

    end_time = time.time()

    if run_process.returncode != 0:
        print("\nRunning error!Please check your source code!")
        # print(run_process.stderr.decode())
        error_exiting()

    print("\n========Finished=======")

    elapsed_time = (end_time - start_time) * 1000
    print(f"Running time: {elapsed_time:.3f} ms")


def exit():
    print("Exiting...")
    sys.exit(0)
