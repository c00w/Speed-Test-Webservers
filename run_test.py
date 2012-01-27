import os, re, subprocess

for item in os.listdir('./'):
    if 'sh' in item:
        for speed in range(0, 2000):
            result = subprocess.Popen(["bash", item, str(speed)], stdout=subprocess.PIPE, close_fds=True)
            result = result.stdout.read()
            per_s = re.search('([0-9.]) \[#/sec\] (mean)', result)
            print per_s
            print result
            per_s = per_s.group(1)
            print per_s

