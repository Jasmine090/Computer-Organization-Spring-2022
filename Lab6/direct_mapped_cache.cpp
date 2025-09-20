#include "direct_mapped_cache.h"

#include <math.h>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

float direct_mapped(string filename, int block_size, int cache_size) {
    int total_num = 0;
    int hit_num = 0;

    /*write your code HERE*/

    ifstream file;
    file.open(filename);

    int index_num = cache_size / block_size;
    int offset_bits = log2(block_size);
    int index_bits = log2(index_num);

    vector<long long> cache_tag(index_num, -1);

    string addr;
    while (file >> addr) {
        total_num++;
        unsigned long long n = stoul(addr, nullptr, 16);
        
        long long block_num = n / block_size;
        int index = block_num % index_num;
        long long tag = n >> (offset_bits + index_bits);

        if (cache_tag[index] == tag)
            hit_num++;
        else
            cache_tag[index] = tag;
    }

    return (float) hit_num / total_num;
}
