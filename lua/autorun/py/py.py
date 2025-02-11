import sys
import subprocess
import os
import time

# 获取文件名（不含扩展名）
source_file = sys.argv[1]
filename, ext = os.path.splitext(os.path.basename(source_file))

print("Start runing...")

# 记录开始时间
start_time = time.time()

# 运行可执行文件
run_command = ['python ' + filename]
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

