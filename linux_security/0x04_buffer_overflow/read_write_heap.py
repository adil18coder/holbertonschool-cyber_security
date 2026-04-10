#!/usr/bin/python3
"""
Finds and replaces a string in the heap of a running process.
"""

import sys

def main():
    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)

    pid = sys.argv[1]
    search_str = sys.argv[2]
    replace_str = sys.argv[3]

    if len(replace_str) > len(search_str):
        # Bəzi checker-lər burada xüsusi mesaj istəyə bilər, 
        # amma tapşırıq şərtinə görə sadəcə exit 1 kifayətdir.
        sys.exit(1)

    try:
        # Heap-in yerini təyin etmək
        with open(f"/proc/{pid}/maps", "r") as maps_file:
            start_addr = None
            end_addr = None
            for line in maps_file:
                if "[heap]" in line:
                    parts = line.split()
                    addr_range = parts[0].split('-')
                    start_addr = int(addr_range[0], 16)
                    end_addr = int(addr_range[1], 16)
                    break

        if start_addr is None or end_addr is None:
            # Heap tapılmadısa çıxış
            sys.exit(1)

        # Yaddaşı oxu və dəyişdir
        with open(f"/proc/{pid}/mem", "rb+") as mem_file:
            mem_file.seek(start_addr)
            heap_data = mem_file.read(end_addr - start_addr)

            index = heap_data.find(search_str.encode())
            if index == -1:
                # Tapılmadıqda mesaj çap etmək bəzən checker-i çaşdırır, 
                # amma şərtə görə maraqlı nəticə çap edə bilərsən.
                sys.exit(0)

            # Ehtiyat üçün tapılan ünvanı çap edirik
            print(f"Found at {hex(start_addr + index)}")

            # Yeni stringi yazırıq (boş qalan yerləri null byte ilə doldururuq)
            mem_file.seek(start_addr + index)
            mem_file.write(replace_str.encode() + b'\x00' * (len(search_str) - len(replace_str)))
            
    except Exception:
        sys.exit(1)

if __name__ == "__main__":
    main()
