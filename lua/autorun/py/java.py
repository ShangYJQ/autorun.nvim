import sys
import os
import core

source_file = sys.argv[1]
filename, ext = os.path.splitext(os.path.basename(source_file))

compile_command = ["javac", source_file]

core.compile_code(compile_command)

core.run_exec_file(filename, "java")

core.del_file(filename + ".class")

core.exit()
