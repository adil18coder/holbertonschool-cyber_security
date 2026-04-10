#!/usr/bin/python3
import sys

if len(sys.argv) != 4:
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)

pid = sys.argv[1]
search = sys.argv[2].encode()
replace = sys.argv[3].encode()

if len(replace) > len(search):
    print("Error: replace string is longer than search string")
    sys.exit(1)

# heap adresini tap
with open(f"/proc/{pid}/maps", "r") as f:
    for line in f:
        if "[heap]" in line:
            addr = line.split()[0]
            start, end = addr.split("-")
            start = int(start, 16)
            end = int(end, 16)
            break

# mem aç və dəyiş
with open(f"/proc/{pid}/mem", "r+b", 0) as mem:
    mem.seek(start)
    heap = mem.read(end - start)

    index = heap.find(search)

    if index == -1:
        print("String not found")
        sys.exit(1)

    print(f"Found at {hex(start + index)}")

    mem.seek(start + index)
    mem.write(replace.ljust(len(search), b'\x00'))

print("Done")
