import sys
import os
import core

core.clear_terminal()

source_file = sys.argv[1]
filename, ext = os.path.splitext(source_file)
dir_name = core.dir_name
json_path = dir_name +'/'+ filename + ".json"
json_data = {}


if not os.path.exists(dir_name):
    print("Json file dont exist!You dont need to del!")
else:
    core.del_file(json_path)
    print("Json file has been deleted")

core.exit()
