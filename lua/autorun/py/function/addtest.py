import sys
import os
import json
import core

core.clear_terminal()

source_file = sys.argv[1]
filename, ext = os.path.splitext(source_file)
dir_name = core.dir_name
json_path = dir_name +'/'+ filename + ".json"
json_data = {}


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


test_index = len(json_data) + 1

json_data[test_index] = input("input your test:\n")

with open(json_path, "w", encoding="utf-8") as file:
    json.dump(json_data, file)
    print("Add the data successfully!")

core.exit()
