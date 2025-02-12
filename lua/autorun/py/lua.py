import sys
from core import core

source_file = sys.argv[1]

core.run_exec_file(source_file, "lua")

core.exit()
