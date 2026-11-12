/* Copyright 2026 gustavosehn */
/* SPDX-License-Identifier: Apache-2.0 */

ENTRY(_start)

SECTIONS {
    . = 0x100000;

    .text : {
        *(.multiboot)
        *(.text)
    }

    .rodata : {
        *(.rodata)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}
