cmd_main_data.o = gcc -Wp,-MD,./.main_data.o.d.tmp -m64 -pthread  -march=native -DRTE_MACHINE_CPUFLAG_SSE -DRTE_MACHINE_CPUFLAG_SSE2 -DRTE_MACHINE_CPUFLAG_SSE3 -DRTE_MACHINE_CPUFLAG_SSSE3 -DRTE_MACHINE_CPUFLAG_SSE4_1 -DRTE_MACHINE_CPUFLAG_SSE4_2 -DRTE_MACHINE_CPUFLAG_AES -DRTE_MACHINE_CPUFLAG_PCLMULQDQ -DRTE_MACHINE_CPUFLAG_AVX -DRTE_COMPILE_TIME_CPUFLAGS=RTE_CPUFLAG_SSE,RTE_CPUFLAG_SSE2,RTE_CPUFLAG_SSE3,RTE_CPUFLAG_SSSE3,RTE_CPUFLAG_SSE4_1,RTE_CPUFLAG_SSE4_2,RTE_CPUFLAG_AES,RTE_CPUFLAG_PCLMULQDQ,RTE_CPUFLAG_AVX  -I/mnt/hgfs/Ben/code/whn/roses/rose/src/naga/main/main/x86_64-native-linuxapp-gcc/include -I/mnt/hgfs/Ben/code/whn/roses/rose/src/naga/x86_64-native-linuxapp-gcc/include -include /mnt/hgfs/Ben/code/whn/roses/rose/src/naga/x86_64-native-linuxapp-gcc/include/rte_config.h -O3  -I ../cmdline  -I ../libzebra  -I ../boots -I ../include -I ../vsr -I ../pid -I ../debug -I ../pub -I ../itf -I ../dmr -I ../acr -I ../adp -I ../netseg -I ../dnet -I ../urlr -I ../url -I ../hijack -I ../domain -I ../rte -I ../pcre-m/pcre -I ../mask  -I ../template  -I ../itf  -O0 -g -o main_data.o -c main_data.c 