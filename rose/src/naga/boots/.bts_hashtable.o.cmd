cmd_bts_hashtable.o = gcc -Wp,-MD,./.bts_hashtable.o.d.tmp -m64 -pthread  -march=native -DRTE_MACHINE_CPUFLAG_SSE -DRTE_MACHINE_CPUFLAG_SSE2 -DRTE_MACHINE_CPUFLAG_SSE3 -DRTE_MACHINE_CPUFLAG_SSSE3 -DRTE_MACHINE_CPUFLAG_SSE4_1 -DRTE_MACHINE_CPUFLAG_SSE4_2 -DRTE_MACHINE_CPUFLAG_AES -DRTE_MACHINE_CPUFLAG_PCLMULQDQ -DRTE_MACHINE_CPUFLAG_AVX -DRTE_COMPILE_TIME_CPUFLAGS=RTE_CPUFLAG_SSE,RTE_CPUFLAG_SSE2,RTE_CPUFLAG_SSE3,RTE_CPUFLAG_SSSE3,RTE_CPUFLAG_SSE4_1,RTE_CPUFLAG_SSE4_2,RTE_CPUFLAG_AES,RTE_CPUFLAG_PCLMULQDQ,RTE_CPUFLAG_AVX  -I/mnt/hgfs/Ben/code/whn/roses/rose/src/naga/boots/boots/x86_64-native-linuxapp-gcc/include -I/mnt/hgfs/Ben/code/whn/roses/rose/src/naga/x86_64-native-linuxapp-gcc/include -include /mnt/hgfs/Ben/code/whn/roses/rose/src/naga/x86_64-native-linuxapp-gcc/include/rte_config.h -I .  -I ../include -I ../libzebra -I ../rte  -O0 -g -o bts_hashtable.o -c bts_hashtable.c 
