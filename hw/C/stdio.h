#ifndef _STDIO_H
#define _STDIO_H

int __attribute__((fastcall, naked)) print_str(const char* s);

#define printf(string) print_str(string);

#endif