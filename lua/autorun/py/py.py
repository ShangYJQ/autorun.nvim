import sys
import subprocess
import os
import time

py_exec = sys.argv[2]

source_file = sys.argv[1]



print("Start runing...")

# 记录开始时间
start_time = time.time()

# 运行可执行文件
run_command = [py_exec,source_file]
run_process = subprocess.run(run_command)

# 记录结束时间
end_time = time.time()

if run_process.returncode != 0:
    print("\nRun error")
    print(run_process.stderr.decode())
    sys.exit(1)

print("\nRun finish")

# 计算程序耗时
elapsed_time = (end_time - start_time) * 1000  # 转换为毫秒
print(f"Run time: {elapsed_time:.3f} ms")

