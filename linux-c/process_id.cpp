#include <stdio.h>
#include <unistd.h>

int main(){
  printf ("The process is the child %d\n", (int) getpid());
  printf ("The process is the parent %d\n", (int) getppid());

  return 0;
}
