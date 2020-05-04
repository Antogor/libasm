# Libasm
Assembly lenguage project from 42

## Sources :page_facing_up:
[Theory about assembly lenguage](http://cv.uoc.edu/annotation/8255a8c320f60c2bfd6c9f2ce11b2e7f/619469/PID_00218273/PID_00218273.html#w31aac15b9c17c17) (Spanish)

[NASM manual](https://www.nasm.us/doc/nasmdoci.html) (English)

[NASM tutorial](https://cs.lmu.edu/~ray/notes/nasmtutorial/) (English)

[Introduction to 8086 architecture](https://www.youtube.com/watch?v=fLutXVgrh1s&t=5s) (Minicourse about 3 videos in Spanish)

[Syntax, instructions and registers about ASM](https://www.youtube.com/watch?v=EkfysK51Xic&list=PLXUmoNhKVPGdK9W6ZYksQzBqcyUMDR86M&index=33&t=64s) (Minicourse about 3 videos in Spanish)

## How to complie ASM :rocket:
First we need the .o files for every .s file:
```linux
nasm -f elf "name of the file" (this will create the .o file)
```
-f = format of the architecture -f elf_x86_64 (cpu 64 bits), elf32 (32 bits) etc..

Once we have the .o files, we need to transform to execute:
```linux
ar rcs "name of the file finisehd with .a" "every .o needed"
```

Then we have to compile the file .a with the mains o C files where call the ASM functions:
```linux
gcc "every C files" ".a file"
```
