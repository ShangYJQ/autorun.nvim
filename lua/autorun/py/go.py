import sys
import os
from core import core

source_file = sys.argv[1]
filename, ext = os.path.splitext(source_file)

filename = filename + "_tmpf"

compile_command = ["go", "build", "-o", filename, source_file]

core.compile_code(compile_command)

core.run_exec_file(filename)

core.del_file(filename)

core.exit()
