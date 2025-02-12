import sys
import os
from core import core

source_file = sys.argv[1]
filename, ext = os.path.splitext(source_file)

if os.path.exists(filename + ".class"):
    core.del_file(filename + ".class")

compile_command = ["javac", source_file]

core.compile_code(compile_command)

core.run_exec_file(filename, "java")

core.del_file(filename + ".class")

core.exit()
