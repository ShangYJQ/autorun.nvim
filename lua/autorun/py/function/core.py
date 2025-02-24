import subprocess
import sys
import os
import time

dir_name = ".testjsondata"

out_len = 40

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


def run_test(filename, index, test_input):
    run_command = ["./" + filename]


    start_time = time.time()

    run_process = subprocess.run(run_command, input=test_input, text=True,capture_output=True)

    end_time = time.time()

    if run_process.returncode != 0:
        estr = f"\033[31m--------{index} Error"
        print(estr+(out_len-len(estr)-10)*"-")
        
        print("Running error! Please check your source code!\033[0m")
        error_exiting()

    elapsed_time = (end_time - start_time) * 1000
    pstr = f"\033[32m-------{index} \033[33m{elapsed_time:.3f} ms\033[32m"

    pstr = pstr + ("-"*(out_len-len(pstr))) + "\033[0m"
    print(pstr)

    print(run_process.stdout)
 
def exit():
    print("Exiting...")
    sys.exit(0)
