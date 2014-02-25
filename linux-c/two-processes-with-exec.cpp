#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int check_bash(char* program, char** arg_list){
  pid_t child_pid;
  child_pid = fork ();

  if(child_pid != 0){
    return child_pid;
  }
  else{
    execvp (program, arg_list);
    fprintf(stderr, "an error has ocurred in execvp\n");
    abort();
  }
}

int main(int argc, const char *argv[]){
  char *arg_list[] = {
    "ps", 
    "|",
    "grep",
    "bash",
    "/",
    NULL
  };
  
  check_bash("ps", arg_list);

  printf("Done with main programm\n");
   
  return EXIT_SUCCESS;
}
