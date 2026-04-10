#!/usr/bin/python3
import sys

if len(sys.argv) != 4:
    sys.exit(1)

pid = sys.argv[1]
search = sys.argv[2].encode()
replace = sys.argv[3].encode()

if len(replace) > len(search):
    sys.exit(1)

with open(f"/proc/{pid}/maps", "r") as f:
    for line in f:
        if "[heap]" in line:
            addr = line.split()[0]
            start, end = addr.split("-")
            start = int(start, 16)
            end = int(end, 16)
            break

with open(f"/proc/{pid}/mem", "r+b", 0) as mem:
    mem.seek(start)
    heap = mem.read(end - start)

    index = heap.find(search)

    if index == -1:
        sys.exit(1)

    mem.seek(start + index)
    mem.write(replace.ljust(len(search), b'\x00'))

print("SUCCESS!")
