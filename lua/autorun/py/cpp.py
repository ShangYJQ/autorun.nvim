import sys
import os
import core

cpp_c = sys.argv[2]
source_file = sys.argv[1]
filename, ext = os.path.splitext(os.path.basename(source_file))

compile_command = [cpp_c, "-std=c++20", source_file, "-o", filename]

core.compile_code(compile_command)

core.run_exec_file(filename)

core.del_file(filename)

core.exit()
