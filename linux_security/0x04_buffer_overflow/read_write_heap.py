#!/usr/bin/python3
"""
Script that finds and replaces a string in the heap of a running process.
Usage: read_write_heap.py pid search_string replace_string
"""
import sys


def main():
    """Main function to read and write to the heap."""
    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)

    pid = sys.argv[1]
    search_string = sys.argv[2]
    replace_string = sys.argv[3]

    if len(replace_string) > len(search_string):
        sys.exit(1)

    try:
        # Get the heap address range from /proc/pid/maps
        with open(f"/proc/{pid}/maps", "r", encoding="utf-8") as maps_file:
            start_addr = None
            end_addr = None
            for line in maps_file:
                if "[heap]" in line:
                    addr_range = line.split()[0]
                    start, end = addr_range.split("-")
                    start_addr = int(start, 16)
                    end_addr = int(end, 16)
                    break

        if start_addr is None:
            sys.exit(1)

        # Access the process memory
        with open(f"/proc/{pid}/mem", "rb+") as mem_file:
            mem_file.seek(start_addr)
            heap = mem_file.read(end_addr - start_addr)

            # Find the string in the heap
            idx = heap.find(search_string.encode())
            if idx == -1:
                sys.exit(0)

            # Write the replacement string
            mem_file.seek(start_addr + idx)
            # Fill with null bytes if replacement is shorter
            new_str = replace_string.encode()
            new_str += b'\x00' * (len(search_string) - len(replace_string))
            mem_file.write(new_str)

    except Exception:
        sys.exit(1)


if __name__ == "__main__":
    main()
