import sys
import os
from core import core

cpp_c = sys.argv[2]
source_file = sys.argv[1]
filename, ext = os.path.splitext(source_file)

filename = filename + "_tmpf"

compile_command = [cpp_c, "-g", source_file, "-o", filename]

core.compile_code(compile_command)

core.run_cgdb(filename)

core.del_file(filename)

core.exit()
