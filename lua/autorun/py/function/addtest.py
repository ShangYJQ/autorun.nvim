import sys
import os
import json
import core


source_file = sys.argv[1]
filename, ext = os.path.splitext(source_file)
dir_name = core.dir_name
json_path = dir_name + "/" + filename + ".json"
json_data = {}


core.clear_terminal()

if not os.path.exists(dir_name):
    os.makedirs(dir_name)
    print("Create ", dir_name)

if not os.path.exists(json_path):
    with open(json_path, "w", encoding="utf-8") as file:
        json.dump({}, file)
    print("Create json file")
else:
    with open(json_path, "r", encoding="utf-8") as file:
        json_data = json.load(file)
    print("Load json data")


opt = "c"
index_num = len(json_data)

while opt == "c":
    index_num +=1
    core.clear_terminal()

    print(f"Input data {index_num}:")
    json_data[index_num] = core.input_eof()

    with open(json_path, "w", encoding="utf-8") as file:
        json.dump(json_data, file)
        print(f"Add the data {index_num} successfully!")

    opt = input("Input c to continue add data\n")

core.exit()
