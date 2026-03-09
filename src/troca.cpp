# include <iostream>

using namespace std;

extern "C" int GetValorASM(int a); // Declaration of the external function implemented in Assembly.

int main() {
    cout << "ASM me deu " << GetValorASM(32) << endl; // ASM me deu 33 (32 + 1)
    return 0;
}
