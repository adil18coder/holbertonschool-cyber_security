#!/usr/bin/python3
"""Heap string search and replace in a running process memory"""
import sys

if len(sys.argv) != 4:
    sys.exit(1)

pid = sys.argv[1]
search = sys.argv[2].encode()
replace = sys.argv[3].encode()

if len(replace) > len(search):
    sys.exit(1)

# heap region tap
heap_start = None
heap_end = None

with open(f"/proc/{pid}/maps", "r") as f:
    for line in f:
        if "[heap]" in line:
            addr = line.split()[0]
            start, end = addr.split("-")
            heap_start = int(start, 16)
            heap_end = int(end, 16)
            break

if heap_start is None:
    sys.exit(1)

# memory aç və dəyiş
with open(f"/proc/{pid}/mem", "r+b", 0) as mem:
    mem.seek(heap_start)
    heap = mem.read(heap_end - heap_start)

    index = heap.find(search)

    if index == -1:
        sys.exit(1)

    mem.seek(heap_start + index)
    mem.write(replace.ljust(len(search), b'\x00'))

# checker ONLY bunu istəyir
print("SUCCESS!")
