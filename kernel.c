// kernel.c - simple hello world

// The following are the possible colors for the terminal
// 0 - Black, 1 - Blue, 2 - Green, 3 - Cyan, 4 - Red, 5 - Magenta, 6 - Brown, 7
// - Light Grey, 8 - Dark Grey, 9 - Light Blue, 10/a - Light Green, 11/b - Light
// Cyan, 12/c - Light Red, 13/d - Light Magenta, 14/e - Light Brown, 15/f –
// White.

enum Color {
    Black,
    Blue,
    Green,
    Cyan, 
    Red,
    Magenta,
    Brown,
    LightGrey,
    DarkGrey,
    LightBlue,
    LightGreen,
    LightCyan,
    LightRed,
    LightMagenta,
    LightBrown,
    White
};

void clear_screen(char* vidptr){
 
    for (unsigned i = 0; i < 80 * 25 * 2; i += 2){
        vidptr[i] = ' ';
        vidptr[i+1] = LightGrey;
    }
    return;
}

void print(const char* str, char* vidptr, const char color){
    for (unsigned i = 0; str[i] != '\0'; ++i){
        unsigned int j = i*2;
        vidptr[j] = str[i];
        vidptr[j+1] = color;
    }
}

void kmain(void) {
    const char* str= "My first kernel is alive";
    char *vidptr = (char*) 0xb8000;                  // Start of video memory

    clear_screen(vidptr);

    print(str, vidptr, LightRed);

    return;
}