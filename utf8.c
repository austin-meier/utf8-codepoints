#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <wchar.h>
#include <locale.h>


int read_unicode_file(FILE *fp);
int unicode_codepoint_bytes(int codepoint);
int fulfills_mask(int mask, int num);


int main(int argc, char **argv) {

  if (argc < 2) {
    printf("Please supply a file argument\n");
    return 1;
  }

  setlocale(LC_CTYPE, "");

  FILE *fp = fopen(argv[1], "r");

  /* Check if the file exists */
  if (fp == NULL) {
    printf("The file provided could not be found\n");
    return 2;
  }

  int num_codepoints = read_unicode_file(fp);
  printf("\nTotal Codepoints: %d\n", num_codepoints);
  return 0;

  /* int codepoint = file_buffer[0]; */
  /* printf("The number of bytes in this codepoint: %d\n", unicode_codepoint_bytes(codepoint)); */
}

int read_unicode_file(FILE *fp) {

  /* Get file size */
  fseek(fp, 0L, SEEK_END);
  int file_size = ftell(fp);

  /* seek back to the beginning of the file */
  rewind(fp);

  char *file_buffer = malloc(file_size);

  /* Check if we ran out of memory */
  if (file_buffer == NULL) {
    printf("Out of mana");
    return 0;
  }

  fread(file_buffer, file_size, 1, fp);

  /* Lets loop through this thang */
  int num_codepoints = 0;
  int i = 0;
  while (i < file_size) {
    int codepoint_size = unicode_codepoint_bytes(file_buffer[i]);

    if (i + codepoint_size <= file_size);

    printf("The number of bytes in this codepoint: %d\n", unicode_codepoint_bytes(file_buffer[i]));

    wchar_t unicode = 0;

    switch (codepoint_size) {

      case 1: {
        unicode =  file_buffer[i];
        break;
      }

      case 2: {
        unicode = (file_buffer[i] & 0b00011111) << 6 | (file_buffer[i+1] & 0b00111111);
        break;
      }

      case 3: {
        unicode = (file_buffer[i] & 0b00001111) << 12 | (file_buffer[i+1] & 0b00111111) << 6 | (file_buffer[i+2] & 0b00111111);
        break;
      }

      case 4: {
        unicode = (file_buffer[i] & 0b00000111) << 18 | (file_buffer[i+1] & 0b00111111) << 12 | (file_buffer[i+2] & 0b00111111) << 6 | (file_buffer[i+3] & 0b00111111);
        break;
      }
    }
    printf("Unicode: U+%x\t%lc\n", unicode, unicode);

    i += codepoint_size;
  }

  return num_codepoints;
}


int fulfills_mask(int mask, int num) {
  return (num & mask) == mask;
}

int unicode_codepoint_bytes(int codepoint) {
  if (fulfills_mask(0b11110000, codepoint)) return 4;
  if (fulfills_mask(0b11100000, codepoint)) return 3;
  if (fulfills_mask(0b11000000, codepoint)) return 2;
  return 1;
}
