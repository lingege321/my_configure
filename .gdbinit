
set history save
set verbose off
set print pretty on
set print array off
set print array-indexes on

#source /grid/cic/vficpv_t2b_001/chienhun/gdbFile/backtraceHL.py
python
import sys
sys.path.insert(0, '/global/freeware/Linux/3.10/gcc-9.2.0/share/gcc-9.2.0/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
source /u/chielin/user-define-views.gdb
#source /grid/cic/vficpv_t2b_001/chienhun/gdbFile/.gdbinit.local
#set prompt \001\033[1;34m\002---------------------------------------------------\n\001\033[1;32m\002>>> \001\033[0m\002
set extended-prompt \[\e[1;34m\]---------------------------------------------------\n\[\e[1;32m\]>>> \[\e[0m\]
