#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>


int main(int argc, char *argv[])
{
    // int parent_write[2], child_write[2], ws;
    // char *cap[2] = {"./tc", NULL}, buf;
    // pid_t cpid;

    // pipe(parent_write);
    // pipe(child_write);

    // /* pipe[0] -> read (you read from it)
    //  * pipe[1] -> write (you write to it)
    //  *
    //  * parent_write[0] -> the child will read this
    //  * parent_write[1] -> the parent writes here
    //  *
    //  * child_write[0] -> the parent reads here
    //  * child_write[1] -> the child writes here
    //  */

    // if(!(cpid = fork())) {
    //     /* child process, the "add" */

    //     /* close the read end of child_write
    //      * close the write end of parent_write
    //      */
    //     close(child_write[0]);
    //     close(parent_write[1]);

    //     /* dup2 will swap our stdin(0) and stdout(1)
    //      * for the pipe 
    //      *
    //      * parent_write[0] -> our new stdin(0)
    //      * child_write[1] -> our new stdout(1)
    //      */
    //     dup2(parent_write[0], 0);
    //     dup2(child_write[1], 1);

    //     execv(*cap, cap);

    // } else {
    //     /* close the read end parent_write
    //      * close the write end of child_write
    //      */
    //     close(parent_write[0]);
    //     close(child_write[1]);

    //     /* dup2 will swap...
    //      *
    //      * parent_write[1] -> new stdout
    //      * child_write[0] -> new stdin
    //      */
    //     dup2(parent_write[1], 1);
    //     dup2(child_write[0], 0);

    //     for(int i = 0; i < 10; i++) {
    //         buf = 'a' + i;
    //         write(1, &buf, 1);
    //         fprintf(stderr, "sent: %c\n", buf);
    //         read(0, &buf, 1);
    //         fprintf(stderr, "got : %c\n", buf);
    //     }
            
    //     kill(cpid, 1);
    //     wait(&ws);
    // }

    int pid = 0, ws = 0, parent_write[2], child_write[2];
    pipe(parent_write);
    pipe(child_write);
    pid = fork();
    if(pid == 0)
    {
        // child
        // close(inter[9]);
        close(child_write[0]);
        close(parent_write[1]);

        // dup2(parent_write[0], 0);
        dup2(child_write[1], 1);
        // char buf[10] = "1234567890";
        // // read(inter[0], buf, 10);
        // fprintf(stderr, "start!\n");
        // for (int a = 0; a < 10; ++a) {
        //     write(1, buf, 10);
        //     fprintf(stderr, "sent: %s\n", buf);
        // }

		execvp(argv[1], argv+1);
    }
    else
    {   
        // parent
        close(parent_write[0]);
        close(child_write[1]);

        // dup2(parent_write[1], 1);
        dup2(child_write[0], 0);

        // close(inter[0]);
        char buf[11] = "";
        // for(int i = 0; i < 10; i++) {
            // write(1, &buf, 10);
            // fprintf(stderr, "sent: %s\n", buf);
            read(0, &buf, 11);
            fprintf(stderr, "got : %s\n", buf);
        // }
            
        // kill(pid, 1);
        // wait(&ws);
        
        // printf("parent = %s", buf);
    }
    return 0;
}