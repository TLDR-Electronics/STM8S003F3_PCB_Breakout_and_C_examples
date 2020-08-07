# Environment Specific Flags
BUILD_FOLDER = $(CURDIR)/bin/


# SDCC Compiler Specific Flags
LIBRARY = -lstm8
COMPILER_TARGET = -mstm8
OUTPUT_FORMAT = --out-fmt-ihx

# STM8FLASH Specific Flags
STM8FLASH_FOLDER = $(HOME)/tools/stm8flash/
DEBUGGER = stlinkv2
FLASH_TARGET = stm8s003?3


.PHONY: blink
blink:
	mkdir -p $(BUILD_FOLDER)
	sdcc stm8S003_flash_example.c $(LIBRARY) $(COMPILER_TARGET) $(OUTPUT_FORMAT) -o$(BUILD_FOLDER)out.ihx

.PHONY: tim2
tim2:
	mkdir -p $(BUILD_FOLDER)
	sdcc stm8S003_tim2_interrupt_example.c $(LIBRARY) $(COMPILER_TARGET) $(OUTPUT_FORMAT) -o$(BUILD_FOLDER)out.ihx

.PHONY: burn
burn:
	$(STM8FLASH_FOLDER)stm8flash -c $(DEBUGGER) -p $(FLASH_TARGET) -w $(BUILD_FOLDER)out.ihx

.PHONY: clean
clean:
	rm -r $(BUILD_FOLDER)

# List of SDCC Commands
# General options:
#       --help                Display this help
#   -v  --version             Display sdcc's version
#       --verbose             Trace calls to the preprocessor, assembler, and linker
#   -V                        Execute verbosely. Show sub commands as they are run
#   -d                        Output list of mcaro definitions in effect. Use with -E
#   -D                        Define macro as in -Dmacro
#   -I                        Add to the include (*.h) path, as in -Ipath
#   -A                        
#   -U                        Undefine macro as in -Umacro
#   -M                        Preprocessor option
#   -W                        Pass through options to the pre-processor (p), assembler (a) or linker (l)
#   -S                        Compile only; do not assemble or link
#   -c  --compile-only        Compile and assemble, but do not link
#   -E  --preprocessonly      Preprocess only, do not compile
#       --c1mode              Act in c1 mode.  The standard input is preprocessed code, the output is assembly code.
#   -o                        Place the output into the given path resp. file
#       --print-search-dirs   display the directories in the compiler's search path
#       --vc                  messages are compatible with Micro$oft visual studio
#       --use-stdout          send errors to stdout instead of stderr
#       --nostdlib            Do not include the standard library directory in the search path
#       --nostdinc            Do not include the standard include directory in the search path
#       --less-pedantic       Disable some of the more pedantic warnings
#       --disable-warning     <nnnn> Disable specific warning
#       --Werror              Treat the warnings as errors
#       --debug               Enable debugging symbol output
#       --cyclomatic          Display complexity of compiled functions
#       --std-c89             Use ISO C90 (aka ANSI C89) standard (slightly incomplete)
#       --std-sdcc89          Use ISO C90 (aka ANSI C89) standard with SDCC extensionsstm8
#       --std-sdcc99          Use ISO C99 standard with SDCC extensions
#       --std-c11             Use ISO C11 standard (incomplete)
#       --std-sdcc11          Use ISO C11 standard with SDCC extensions (default)
#       --std-c2x             Use ISO C2X standard (incomplete)
#       --std-sdcc2x          Use ISO C2X standard with SDCC extensions
#       --fdollars-in-identifiers  Permit '$' as an identifier character
#       --fsigned-char        Make "char" signed by default
#       --use-non-free        Search / include non-free licensed libraries and header files
# 
# Code generation options:
#   -m                        Set the port to use e.g. -mz80.
#   -p                        Select port specific processor e.g. -mpic14 -p16f84
#       --stack-auto          Stack automatic variables
#       --xstack              Use external stack
#       --int-long-reent      Use reentrant calls on the int and long support functions
#       --float-reent         Use reentrant calls on the float support functions
#       --xram-movc           Use movc instead of movx to read xram (xdata)
#       --callee-saves        <func[,func,...]> Cause the called function to save registers instead of the caller
#       --profile             On supported ports, generate extra profiling information
#       --fomit-frame-pointer  Leave out the frame pointer.
#       --all-callee-saves    callee will always save registers used
#       --stack-probe         insert call to function __stack_probe at each function prologue
#       --no-xinit-opt        don't memcpy initialized xram from code
#       --no-c-code-in-asm    don't include c-code as comments in the asm file
#       --no-peep-comments    don't include peephole optimizer comments
#       --codeseg             <name> use this name for the code segment
#       --constseg            <name> use this name for the const segment
#       --dataseg             <name> use this name for the data segment
# 
# Optimization options:
#       --nooverlay           Disable overlaying leaf function auto variables
#       --nogcse              Disable the GCSE optimisation
#       --nolabelopt          Disable label optimisation
#       --noinvariant         Disable optimisation of invariants
#       --noinduction         Disable loop variable induction
#       --noloopreverse       Disable the loop reverse optimisation
#       --no-peep             Disable the peephole assembly file optimisation
#       --no-reg-params       On some ports, disable passing some parameters in registers
#       --peep-asm            Enable peephole optimization on inline assembly
#       --peep-return         Enable peephole optimization for return instructions
#       --no-peep-return      Disable peephole optimization for return instructions
#       --peep-file           <file> use this extra peephole file
#       --opt-code-speed      Optimize for code speed rather than size
#       --opt-code-size       Optimize for code size rather than speed
#       --max-allocs-per-node  Maximum number of register assignments considered at each node of the tree decomposition
#       --nolospre            Disable lospre
#       --allow-unsafe-read   Allow optimizations to read any memory location anytime
#       --nostdlibcall        Disable optimization of calls to standard library
# 
# Internal debugging options:
#       --dump-ast            Dump front-end AST before generating i-code
#       --dump-i-code         Dump the i-code structure at all stages
#       --dump-graphs         Dump graphs (control-flow, conflict, etc)
#       --i-code-in-asm       Include i-code as comments in the asm file
#       --fverbose-asm        Include code generator comments in the asm output
# 
# Linker options:
#   -l                        Include the given library in the link
#   -L                        Add the next field to the library search path
#       --lib-path            <path> use this path to search for libraries
#       --out-fmt-ihx         Output in Intel hex format
#       --out-fmt-s19         Output in S19 hex format
#       --xram-loc            <nnnn> External Ram start location
#       --xram-size           <nnnn> External Ram size
#       --iram-size           <nnnn> Internal Ram size
#       --xstack-loc          <nnnn> External Stack start location
#       --code-loc            <nnnn> Code Segment Location
#       --code-size           <nnnn> Code Segment size
#       --stack-loc           <nnnn> Stack pointer initial value
#       --data-loc            <nnnn> Direct data start location
#       --idata-loc           
#       --no-optsdcc-in-asm   Do not emit .optsdcc in asm
# 
# Special options for the mcs51 port:
#       --model-small         internal data space is used (default)
#       --model-medium        external paged data space is used
#       --model-large         external data space is used
#       --model-huge          functions are banked, data in external space
#       --stack-size          Tells the linker to allocate this space for stack
#       --parms-in-bank1      use Bank1 for parameter passing
#       --pack-iram           Tells the linker to pack variables in internal ram (default)
#       --no-pack-iram        Deprecated: Tells the linker not to pack variables in internal ram
#       --acall-ajmp          Use acall/ajmp instead of lcall/ljmp
#       --no-ret-without-call  Do not use ret independent of acall/lcall
# 
# Special options for the z80 port:
#       --callee-saves-bc     Force a called function to always save BC
#       --portmode=           Determine PORT I/O mode (z80/z180)
#       --asm=                Define assembler name (rgbds/asxxxx/isas/z80asm)
#       --codeseg             <name> use this name for the code segment
#       --constseg            <name> use this name for the const segment
#       --dataseg             <name> use this name for the data segment
#       --no-std-crt0         For the z80/gbz80 do not link default crt0.rel
#       --reserve-regs-iy     Do not use IY (incompatible with --fomit-frame-pointer)
#       --oldralloc           Use old register allocator
#       --fno-omit-frame-pointer  Do not omit frame pointer
#       --emit-externs        Emit externs list in generated asm
# 
# Special options for the z180 port:
#       --callee-saves-bc     Force a called function to always save BC
#       --portmode=           Determine PORT I/O mode (z80/z180)
#       --asm=                Define assembler name (rgbds/asxxxx/isas/z80asm)
#       --codeseg             <name> use this name for the code segment
#       --constseg            <name> use this name for the const segment
#       --dataseg             <name> use this name for the data segment
#       --no-std-crt0         For the z80/gbz80 do not link default crt0.rel
#       --reserve-regs-iy     Do not use IY (incompatible with --fomit-frame-pointer)
#       --oldralloc           Use old register allocator
#       --fno-omit-frame-pointer  Do not omit frame pointer
#       --emit-externs        Emit externs list in generated asm
# 
# Special options for the r2k port:
#       --callee-saves-bc     Force a called function to always save BC
#       --portmode=           Determine PORT I/O mode (z80/z180)
#       --asm=                Define assembler name (rgbds/asxxxx/isas/z80asm)
#       --codeseg             <name> use this name for the code segment
#       --constseg            <name> use this name for the const segment
#       --dataseg             <name> use this name for the data segment
#       --no-std-crt0         For the z80/gbz80 do not link default crt0.rel
#       --reserve-regs-iy     Do not use IY (incompatible with --fomit-frame-pointer)
#       --oldralloc           Use old register allocator
#       --fno-omit-frame-pointer  Do not omit frame pointer
#       --emit-externs        Emit externs list in generated asm
# 
# Special options for the r3ka port:
#       --callee-saves-bc     Force a called function to always save BC
#       --portmode=           Determine PORT I/O mode (z80/z180)
#       --asm=                Define assembler name (rgbds/asxxxx/isas/z80asm)
#       --codeseg             <name> use this name for the code segment
#       --constseg            <name> use this name for the const segment
#       --dataseg             <name> use this name for the data segment
#       --no-std-crt0         For the z80/gbz80 do not link default crt0.rel
#       --reserve-regs-iy     Do not use IY (incompatible with --fomit-frame-pointer)
#       --oldralloc           Use old register allocator
#       --fno-omit-frame-pointer  Do not omit frame pointer
#       --emit-externs        Emit externs list in generated asm
# 
# Special options for the gbz80 port:
#       -bo                   <num> use code bank <num>
#       -ba                   <num> use data bank <num>
#       --callee-saves-bc     Force a called function to always save BC
#       --codeseg             <name> use this name for the code segment
#       --constseg            <name> use this name for the const segment
#       --dataseg             <name> use this name for the data segment
#       --no-std-crt0         For the z80/gbz80 do not link default crt0.rel
# 
# Special options for the tlcs90 port:
#       --callee-saves-bc     Force a called function to always save BC
#       --portmode=           Determine PORT I/O mode (z80/z180)
#       --asm=                Define assembler name (rgbds/asxxxx/isas/z80asm)
#       --codeseg             <name> use this name for the code segment
#       --constseg            <name> use this name for the const segment
#       --dataseg             <name> use this name for the data segment
#       --no-std-crt0         For the z80/gbz80 do not link default crt0.rel
#       --reserve-regs-iy     Do not use IY (incompatible with --fomit-frame-pointer)
#       --oldralloc           Use old register allocator
#       --fno-omit-frame-pointer  Do not omit frame pointer
#       --emit-externs        Emit externs list in generated asm
# 
# Special options for the ez80_z80 port:
#       --callee-saves-bc     Force a called function to always save BC
#       --portmode=           Determine PORT I/O mode (z80/z180)
#       --asm=                Define assembler name (rgbds/asxxxx/isas/z80asm)
#       --codeseg             <name> use this name for the code segment
#       --constseg            <name> use this name for the const segment
#       --dataseg             <name> use this name for the data segment
#       --no-std-crt0         For the z80/gbz80 do not link default crt0.rel
#       --reserve-regs-iy     Do not use IY (incompatible with --fomit-frame-pointer)
#       --oldralloc           Use old register allocator
#       --fno-omit-frame-pointer  Do not omit frame pointer
#       --emit-externs        Emit externs list in generated asm
# 
# Special options for the ds390 port:
#       --model-flat24        use the flat24 model for the ds390 (default)
#       --stack-8bit          use the 8bit stack for the ds390 (not supported yet)
#       --stack-size          Tells the linker to allocate this space for stack
#       --pack-iram           Tells the linker to pack variables in internal ram (default)
#       --no-pack-iram        Deprecated: Tells the linker not to pack variables in internal ram
#       --stack-10bit         use the 10bit stack for ds390 (default)
#       --use-accelerator     generate code for ds390 arithmetic accelerator
#       --protect-sp-update   will disable interrupts during ESP:SP updates
#       --parms-in-bank1      use Bank1 for parameter passing
# 
# Special options for the pic16 port:
#       --pstack-model=       use stack model 'small' (default) or 'large'
#   -y  --extended            enable Extended Instruction Set/Literal Offset Addressing mode
#       --pno-banksel         do not generate BANKSEL assembler directives
#       --obanksel=           set banksel optimization level (default=0 no)
#       --denable-peeps       explicit enable of peepholes
#       --no-optimize-goto    do NOT use (conditional) BRA instead of GOTO
#       --optimize-cmp        try to optimize some compares
#       --optimize-df         thoroughly analyze data flow (memory and time intensive!)
#       --asm=                Use alternative assembler
#       --mplab-comp          enable compatibility mode for MPLAB utilities (MPASM/MPLINK)
#       --link=               Use alternative linker
#       --preplace-udata-with=  Place udata variables at another section: udata_acs, udata_ovr, udata_shr
#       --ivt-loc=            Set address of interrupt vector table.
#       --nodefaultlibs       do not link default libraries when linking
#       --use-crt=            use <crt-o> run-time initialization module
#       --no-crt              do not link any default run-time initialization module
#       --debug-xtra          show more debug info in assembly output
#       --debug-ralloc        dump register allocator debug file *.d
#       --pcode-verbose       dump pcode related info
#       --calltree            dump call tree in .calltree file
#       --gstack              trace stack pointer push/pop to overflow
#       --no-warn-non-free    suppress warning on absent --use-non-free option
# 
# Special options for the pic14 port:
#       --debug-xtra          show more debug info in assembly output
#       --no-pcode-opt        disable (slightly faulty) optimization on pCode
#       --stack-size          sets the size if the argument passing stack (default: 16, minimum: 4)
#       --no-extended-instructions  forbid use of the extended instruction set (e.g., ADDFSR)
#       --no-warn-non-free    suppress warning on absent --use-non-free option
# 
# Special options for the TININative port:
#       --model-flat24        use the flat24 model for the ds390 (default)
#       --stack-8bit          use the 8bit stack for the ds390 (not supported yet)
#       --stack-size          Tells the linker to allocate this space for stack
#       --pack-iram           Tells the linker to pack variables in internal ram (default)
#       --no-pack-iram        Deprecated: Tells the linker not to pack variables in internal ram
#       --stack-10bit         use the 10bit stack for ds390 (default)
#       --use-accelerator     generate code for ds390 arithmetic accelerator
#       --protect-sp-update   will disable interrupts during ESP:SP updates
#       --parms-in-bank1      use Bank1 for parameter passing
#       --tini-libid          <nnnn> LibraryID used in -mTININative
# 
# Special options for the ds400 port:
#       --model-flat24        use the flat24 model for the ds400 (default)
#       --stack-8bit          use the 8bit stack for the ds400 (not supported yet)
#       --stack-size          Tells the linker to allocate this space for stack
#       --pack-iram           Tells the linker to pack variables in internal ram (default)
#       --no-pack-iram        Deprecated: Tells the linker not to pack variables in internal ram
#       --stack-10bit         use the 10bit stack for ds400 (default)
#       --use-accelerator     generate code for ds400 arithmetic accelerator
#       --protect-sp-update   will disable interrupts during ESP:SP updates
#       --parms-in-bank1      use Bank1 for parameter passing
# 
# Special options for the hc08 port:
#       --model-small         8-bit address space for data
#       --model-large         16-bit address space for data (default)
#       --out-fmt-elf         Output executable in ELF format
#       --oldralloc           Use old register allocator
# 
# Special options for the s08 port:
#       --model-small         8-bit address space for data
#       --model-large         16-bit address space for data (default)
#       --out-fmt-elf         Output executable in ELF format
#       --oldralloc           Use old register allocator
# 
# Special options for the stm8 port:
#       --model-medium        16-bit address space for both data and code (default)
#       --model-large         16-bit address space for data, 24-bit for code
#       --codeseg             <name> use this name for the code segment
#       --constseg            <name> use this name for the const segment
#       --out-fmt-elf         Output executable in ELF format