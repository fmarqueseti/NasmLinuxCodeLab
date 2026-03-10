#include <iostream>

using namespace std;

extern "C" int PassarParam(int a, int b, int c);

int main() {
    cout << "Foi retornado: " << PassarParam(50, 40, 10) << endl;
    return 0;
}
