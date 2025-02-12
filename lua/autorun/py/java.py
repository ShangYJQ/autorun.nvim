import sys
import os
from core import core

source_file = sys.argv[1]
filename, ext = os.path.splitext(os.path.basename(source_file))

filename = filename + "_tmpf"

compile_command = ["javac", source_file]

core.compile_code(compile_command)

core.run_exec_file(filename, "java")

core.del_file(filename + ".class")

core.exit()
