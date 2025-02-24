import sys
import os
import json
import core


core.clear_terminal()

source_file = sys.argv[1]
cpp_c = sys.argv[2]
filename, ext = os.path.splitext(source_file)
dir_name = core.dir_name
json_path = dir_name +'/'+ filename + ".json"
json_data = {}
data_num = 0

if not os.path.exists(json_path):
    print("Json file not exists!Please add test first!")
    core.exit()
else:
    with open(json_path,'r',encoding='utf-8') as file:
        json_data = json.load(file)
        data_num = len(json_data)

outname = filename + "_tmpf"

core.compile_code([cpp_c, "-Wall", "-std=c++20", source_file, "-o", outname])
core.clear_terminal()

for key,test in json_data.items():
    core.run_test(outname,int(key),test)

print("\033[32m--------Finished---------\033[0m")

core.del_file(outname)

core.exit()

