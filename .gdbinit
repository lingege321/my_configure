
set verbose off
set print pretty on
set print array off
set print array-indexes on
set pagination off

#source /grid/cic/vficpv_t2b_001/chienhun/gdbFile/backtraceHL.py
#source /u/chielin/user-define-views.gdb
python
import sys
sys.path.insert(0, '/global/freeware/Linux/3.10/gcc-9.2.0/share/gcc-9.2.0/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
#source /grid/cic/vficpv_t2b_001/chienhun/gdbFile/.gdbinit.local
set prompt \033[1;34m---------------------------------------------------\n\033[1;32m>>> \033[0m
