#include <iostream>
using namespace std;

class Rectangle {
    private:
        int width, height;
    public:
        Rectangle(): width{1}, height{1}
        {}

        Rectangle(int width, int height) {
            this->width = width;
            this->height = height;
        }

        void resize(int width, int height) {
            this->width = width;
            this->height = height;
        }

        int get_area() const {
            return this->width*this->height;
        }

        int get_width() const {
            return this->width;
        }

        int get_heigth() const {
            return this->height;
        }        
};

int main(int argc, char **argv) {
    auto i = 3.0/2;
    Rectangle rec_1{2, 3}, rec_2{};
    Rectangle const rec_3{34, 56};

    cout << rec_1.get_area() << endl;
    cout << rec_2.get_area() << endl;
    cout << rec_3.get_area() << endl;

    cout << i << endl;
    cout << "Hello, World!" << endl;
    cout << sizeof(int) << endl;
    
    return 0;
}
