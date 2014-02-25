#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int spawn (const char *program, const char *const arg_list[])
{
  pid_t child_pid;
  child_pid = fork();
  if(child_pid != 0)
    return child_pid;
  else{
    execvp (program, (char **)arg_list);
    fprintf(stderr, "an error ocurred in execvp\n");
    abort();
  }
}

int main(){
  const char *const arg_list[] = {
    "ls",
    "-l",
    "/",
    NULL
  };
 
  spawn("ls", arg_list);
  return EXIT_SUCCESS;
}
