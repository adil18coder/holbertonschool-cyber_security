#!/bin/bash
# auth.log faylında yalnız iptables qaydası əlavə edən (-A və ya -I) sətirləri sayır
grep "iptables" auth.log | grep -E "\-A|\-I" | wc -l
