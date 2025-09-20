#include "set_associative_cache.h"

#include <math.h>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <set>
#include <algorithm>

using namespace std;

float set_associative(string filename, int way, int block_size, int cache_size)
{
    int total_num = 0;
    int hit_num = 0;

    /*write your code HERE*/
    
    ifstream file;
    file.open(filename);

    int index_num = cache_size / block_size / way;
    int offset_bits = log2(block_size);
    int index_bits = log2(index_num);

    vector<set<long long>> cache_tag(index_num, set<long long>());
    vector<vector<pair<int, long long>>> lru(index_num, vector<pair<int, long long>>(way, {0, 0})); // count, tag

    string addr;
    while (file >> addr) {
        total_num++;
        unsigned long long n = stoul(addr, nullptr, 16);
        
        long long block_num = n / block_size;
        int index = block_num % index_num;
        long long tag = n >> (offset_bits + index_bits);

        if (cache_tag[index].count(tag)) {
            hit_num++;
            for(int i = 0; i < way; i++)
                if(lru[index][i].second == tag)
                    lru[index][i].first = total_num;
        }
        else {
            if(lru[index][0].first != 0){
                cache_tag[index].erase(lru[index][0].second);
                lru[index][0] = {0, 0};
            }
            cache_tag[index].insert(tag);
            lru[index][0] = {total_num, tag};
        }
        sort(lru[index].begin(), lru[index].end());

    }

    return (float) hit_num / total_num;
}
