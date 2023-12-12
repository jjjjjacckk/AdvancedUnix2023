#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <dirent.h>
#include <sys/stat.h>
#include <stack>
#include <filesystem>
using namespace std;

int main(int argc, char *argv[]) {
    string dir = string(argv[1]), magicNum = string(argv[2]); 

    DIR *dirHandler;
    struct dirent *ent;
    fstream filename;
    for (const auto& entry : filesystem::recursive_directory_iterator(dir)) {
        struct stat fileinfo;

        // Converting the path to const char * in the
        // subsequent lines
        filesystem::path outfilename = entry.path();
        string outfilename_str = outfilename.string();
        string input = "";
        const char* path = outfilename_str.c_str();


        // Testing whether the path points to a
        // non-directory or not If it does, displays path
        cerr << "path = " << path << endl;
        if (entry.is_regular_file()) {
            // folder
            cerr << "path inner = " << path << endl;
            fstream filename(path, ios::in);
            if (filename.is_open()) {
                filename >> input;
                cerr << "input = " << input << '\n';
                // if (input.find(magicNum) != string::npos) {
                if (input == magicNum) {
                    cout << path << '\n';
                }
            } else {
                cerr << "file not open\n";
            }
            filename.close();
        }
    }  

    // while (!foldersUnvisited.empty()) {
    //     dir = foldersUnvisited.top();
    //     foldersUnvisited.pop();
    //     cerr << "folder = " << dir << '\n';



    //     // if ((dirHandler = opendir(dir.c_str())) != NULL) {
    //     //     while ((ent = readdir(dirHandler)) != NULL) {
    //     //         cerr << "filename = " << ent->d_name << '\n';

    //     //         string input = "";
    //     //         stringstream buffer;
    //     //         struct stat fileinfo;
    //     //         // filename.open((dir + "/" + string(ent->d_name)).c_str(), ios::in | ios::out);
    //     //         if (string(ent->d_name) == "." || string(ent->d_name) == "..") {
    //     //             continue;
    //     //         }

    //     //         // check if folder
    //     //         stat((dir + "/" + string(ent->d_name)).c_str(), &fileinfo);
    //     //         if (fileinfo.st_mode & S_IFDIR) {
    //     //             foldersUnvisited.push(dir + "/" + string(ent->d_name));
    //     //             cerr << "unvisited = " << dir + "/" + string(ent->d_name) << '\n';
    //     //             continue;
    //     //         }

    //     //         // not folder
    //     //         filename.open(dir + "/" + string(ent->d_name));
    //     //         cerr << "isopen = " << filename.is_open() << '\n';
    //     //         if (!filename.is_open()) {
    //     //             filename.close();
    //     //             continue;
    //     //         }
    //     //         buffer << filename.rdbuf();

    //     //         // getline(filename, input, '\n');
    //     //         cerr << "input = " << buffer.str() << '\n';

    //     //         if (atoi(input.c_str()) == magicNum) {
    //     //             cerr << (dir + "/" + string(ent->d_name)) << " | found!\n";
    //     //             cout << (dir + "/" + string(ent->d_name));
    //     //             break;
    //     //         }

    //     //         filename.close();
    //     //     }

    //     //     closedir(dirHandler);
    //     // } else {
    //     //     perror ("");
    //     //     return EXIT_FAILURE;
    //     // }
    // }

    return 0;
}