#include <iostream>

using namespace std;

extern "C" long Fibonacci(long a); // long type represents a 64 bits integer in x86-64 architecture

int main() {
    // Position: 0; 1; 2; 3; 4; 5;  6;  7;  8;  9; 10;  11;  12;  13.
    // Element.: 1; 1; 2; 3; 5; 8; 13; 21; 34; 55; 89; 144; 233; 377.
    cout << "O " << 13 << " elemento da sequencia de Fibonacci: " << Fibonacci(13) << endl;
    return 0;
}