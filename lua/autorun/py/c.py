import sys
import os
from core import core

c_c = sys.argv[2]
source_file = sys.argv[1]
filename, ext = os.path.splitext(os.path.basename(source_file))

filename = filename + "_tmpf"

compile_command = [c_c, "-std=c17", source_file, "-o", filename]

core.compile_code(compile_command)

core.run_exec_file(filename)

core.del_file(filename)

core.exit()
