#include <iostream>

using namespace std;

extern "C" int Question(int a); // Declare external function implemented in Assembly.

int main() {
    if (Question(22) == 1) {
        cout << "Numero Par" << endl;
    } else {
        cout << "Numero Impar" << endl;
    }

    return 0;
}
