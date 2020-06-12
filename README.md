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
-f = format of the architecture -f elf_x86_64 (cpu 64 bits), elf32 (32 bits) etc.. (Use "nasm -hf" command for more help)

Once we have the .o files, we need to transform to execute:
```linux
ar rcs "name of the file finisehd with .a" "every .o needed"
```

Then we have to compile the file .a with the mains o C files where call the ASM functions:
```linux
gcc "every C files" ".a file"
```

## Basic test :white_check_mark:
To run the test, copy the Makefile in the path with yours functions
```make
make test
```
Run the binary file ./test and choose what test do you want to run:

    - cmp = ft_strcmp
    
    - len = ft_strlen
    
    - cpy = ft_strcpy
    
    - dup = ft_strdup
    
    - w = write
    
    - r = read

This test print in the terminal your results and the original results from the built-in functions

You can edit tests.c file to change and proof whatever you want.

Is my first test so maybe could have problems (undifene behaviours), and not contemplate every crazy scenario. Don't base your work only in this test, use it like reference and path to create your test. I'll actualize it

If you have any sugest to improve this test i'll recive it with open arms.
