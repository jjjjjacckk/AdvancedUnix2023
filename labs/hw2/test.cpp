#include <iostream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

int main() {
    // string a = "123 123 123 123", tmp = "";
    // stringstream ss(a);
    // while(!ss.eof()) {
    //     ss >> tmp;
    //     cout << ss.str().size() << ' ' << tmp << '\n';
    // }

    vector<string> t(6, "1");
    for (string str: t) 
        cout << str << ' ';
    cout << '\n';

    t.resize(6, "2");

    for (string str: t) 
        cout << str << ' ';
    cout << '\n';


    return 0;
}