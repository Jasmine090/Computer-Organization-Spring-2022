#Fibonacci
#total: 559
.data
N: .word 7
str: .string "th number in the Fibonacci sequence is "


.text
main:
        lw       a0, N                  1   
        jal      ra, fib                2

        #print
        jal      ra, printResult        546

        #exit problem                   
        li       a0, 10                 558
        ecall                           559

fib:
        bne      a0, zero, fib_not_0 (7)3   (6)11  (5)19   (4)27   (3)35  (2)43  (1)51    (0)63  (1)79  (2)99   (3)144  (4)217  (5)343
        mv       a1, a0                 544    337    211     138     93     73     57       64     84     129     202     328     535
        ret                             545    338    212     139     94     74     58       65     85     130     203     329     536

fib_not_0:
        addi     t0, a0, -1             4      12     20      28      36     44     52              80     100
        bne      t0, zero, fib_not_01   5      13     21      29      37     45     53              81     101   
        mv       a1, a0                 542    335    209     136     91     71     54              82     127   
        ret                             543    336    210     137     92     72     55              83     128   
 
fib_not_01:
        addi     sp, sp, -24            6      14     22      30      38     46          
        sw       ra, 0(sp)              7      15     23      31      39     47        
        sw       a0, 8(sp)              8      16     24      32      40     48        
        addi     a0, a0, -1             9      17     25      33      41     49       
        jal      ra, fib                10     18     26      34      42     50        
        sw       a1, 16(sp)             339    213    140     95      75     59         
        lw       a0, 8(sp)              340    214    141     96      76     60   
        addi     a0, a0, -2             341    215    142     97      77     61   
        jal      ra, fib                342    216    143     98      78     62   
        lw       a3, 16(sp)             537    330    204     131     86     66
        add      a1, a1, a3             538    331    205     132     87     67
        lw       ra, 0(sp)              539    332    206     133     88     68
        addi     sp, sp, 24             540    333    207     134     89     69
        ret                             541    334    208     135     90     70
        

printResult:
        lw       t0, N                  547
        mv       t1, a1                 548

        mv       a1, t0                 549
        li       a0, 1                  550
        ecall                           551

        la       a1, str                552
        li       a0, 4                  553 
        ecall

        mv       a1, t1                 554
        li       a0, 1                  555
        ecall                           556

        ret                             557
