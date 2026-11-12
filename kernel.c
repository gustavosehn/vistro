void put_char(int x, int y, char c, char fg, char bg) {
    char* vga = (char*)0xB8000;
    int pos = (y * 80 + x) * 2;
    
    vga[pos] = c;
    vga[pos + 1] = (bg << 4) | fg;
}

void clear_screen() {
    char* vga = (char*)0xB8000;
    
    for (int i = 0; i < 4000; i += 2) {
    vga[i] = ' ';
    vga[i + 1] = 0x0F;
    }
}

void printf(char* string) {
    int i = 0;
    while(string[i] != 0) {
    put_char(i, 0, string[i], 15, 0);
    i++;
    }
}

void kernel_main() {
    clear_screen();
    printf("Hello, World!");
}