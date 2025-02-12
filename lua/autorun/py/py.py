import sys
from core import core

py_exec = sys.argv[2]

source_file = sys.argv[1]

core.run_exec_file(source_file, py_exec)

core.exit()
