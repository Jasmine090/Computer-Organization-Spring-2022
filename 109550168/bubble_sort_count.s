#Bubble Sort
#total: 1341
.data
arr: .word 5, 3, 6, 7, 31, 23, 43, 12, 45, 1

n: .word 10

str: .string " "
str1: .string "\n"
str2: .string "Sorted \n"
str3: .string "Array \n"

.text
main:
#array initialize
        la      t0, arr              1
        lw      t1, n                2
        slli    t2, t1, 2            3
        add     t0, t0, t2           4
        addi    t0, t0, -4           5
        jal     ra, loop             6

        la      a1, str3             128
        li      a0, 4                129
        ecall                        130
        li      a6, 0                131
        lw      a7, n                132
        jal     ra, printResult      133
        la      a1, str1             224
        li      a0, 4                225
        ecall                        226
        
        jal     ra, bubble1          227

        la      a1, str2             1242
        li      a0, 4                1243
        ecall
        li      a6, 0                1244
        lw      a7, n                1245
        jal     ra, printResult      1246
        la      a1, str1             1337
        li      a0, 4                1338
        ecall                        1339

        li      a0, 10               1340
        ecall                        1341
#load array, and save in s0
loop:
        addi    sp, sp, -8       (10)7   (9)15   (8)23  (7)31                                           (0)
        sw      ra, 0(sp)            8      16      24     32                                                
        addi    t1, t1, -1           9      17      25     33
        addi    s0, s0, -4          10      18      26     34
        lw      t2, 0(t0)           11      19      27     35
        sw      t2, 0(s0)           12      20      28     36
        addi    t0, t0, -4          13      21      29     37
        bne     t1, zero, loop      14      22      30     38     46     54     62     70  (2)78  (1)86    94
        lw      ra, 0(sp)           125     122     119    116    113    110    107    104    101    98    95
        addi    sp, sp, 8           126     123     120    117    114    111    108    105    102    99    96
        ret                         127     124     121    118    115    112    109    106    103    100   97
#a3 = i = 0, a5 = n
bubble1:
        addi    sp, sp, -8          228
        sw      ra, 0(sp)           229
        li      a3, 0               230
        lw      a5, n               231
        jal     ra, bubble2         232
        lw      ra, 0(sp)           1239
        addi    sp, sp, 8           1240
        ret                         1241
#j = i-1, in loop j, i++(loop i)
bubble2:
#if i > n, ret
        bge     a3, a5, return(0,10)233   (1)241  (2)275  (3)313  (4)359  (5)420   (6)517    (7)615   (8)783   (9)904   1208 
        addi    sp, sp, -8          234      242             314     360     421      518       616      784      905
        sw      ra, 0(sp)           235      243             315     361     422      519       617      785      906
        addi    a4, a3, -1   a4:(-1)236   (0)244  (1)     (2)316  (3)362  (4)423   (5)520    (6)618   (7)786   (8)907
        jal     ra, bubble3         237      245     279     317     363     424      521       619      787      908
        addi    a3, a3, 1           239      273     311     357     418     515      613       781      902      1206
        jal     ra, bubble2         240      274     312     358     419     516      614       782      903      1207
        lw      ra,0(sp)            1236     1233    1230    1227    1224    1221     1218      1215     1212     1209
        addi    sp,sp,8             1237     1234    1231    1228    1225    1222     1219      1216     1213     1210
        ret                         1238     1235    1232    1229    1226    1223     1220      1217     1214     1211
#if arr[j+1] > array[j](loop j)
bubble3:
#if j > 0, ret  
        blt     a4, zero, return (-1)238  (0)246    (-1)268     (1)280   (0)292   (-1)304  (2)318  (1)     (0)    (-1)356  (3)364  (2)     (1)     (0)     (-1)417    (4)425     (3)423     (2)       (1)       (0)      (-1)514   (5)522   (4)     (3)      (2)     (1)     (0)     (-1)613    (6)620     (5)      (4)        (3)       (2)      (1)     (0)      (-1)781   (7)788  (6)     (5)    (4)    (3)   (2)    (1)   (0)     (-1)901    (8)909   (7)    (6)     (5)     (4)     (3)      (2)     (1)       (0)    (-1)1205
        addi    sp, sp, -8                   247                                              319                             365                                        426        
        sw      ra, 0(sp)                    248                                              320                             366                                        427        
        slli    a6, a4, 2                    249                                              321                             367                                        428        
        add     a7, s0, a6                   250                                              322                             368                                        429        
        lw      a1, 0(a7)                    251                                              323                             369                                        430        
        lw      a2, 4(a7)                    252                   286                        324                             370                                        431        
#if arr[j+1] > arr[j], no change
        bge     a2, a1, bubble4              253                   287      299               325     340     355             371     386     401     416                432        468        483        498        513              537      552     567      582      591     612               627        663      699        735       750       765     780               795     810     825    840    855   870    885    900               916      952     988     1024     1060     1096     1132     1168     1204                                                                                                          
#else, swap, and j--, loop again             # for the numbers above, from blt to lw a2 need to be added 7, and for each loop, add 36 if there is a swap, add15 if there is no swap
        jal     ra, bubble5                  254                                                                                                                         433                                                                                                                                                                                     
        addi    a4, a4, -1                   266                                                                                                                         444                                                                                                                       
        jal     ra, bubble3                 "269"                                                                                                                                                                                                                                                  
        lw      ra, 0(sp)                    270"
        addi    sp, sp, 8                    271"
        ret                                  272"
#j--, loop again
bubble4:
        addi    sp, sp, -8                                         288      300     
        sw      ra, 0(sp)                                          289      301      
        addi    a4, a4, -1                                         290      302      
        jal     ra, bubble3                                        291      303      
        lw      ra, 0(sp)                                          308      305
        addi    sp, sp, 8                                          309      306
        ret                                                        310      307
#swap
bubble5:
        addi    sp, sp, -8          255
        sw      ra, 0(sp)           256
        slli    a6, a4, 2           257
        add     a7, s0, a6          258
        lw      a1, 0(a7)           259
        lw      a2, 4(a7)           260
        sw      a2, 0(a7)           261
        sw      a1, 4(a7)           262
        lw      ra, 0(sp)           263
        addi    sp, sp, 8           264
        ret                         265
#risc v need at least one line to return
return:
        addi    a0, a0, 0
        ret

#print
printResult:
        addi    sp,sp,-8            (1)134  (2)146  (3)     (4)     (5)     (6)             
        sw      ra,0(sp)               135     147                                          
#s2 = s0 + 4*i
        slli    a0,a6,2                136     148                                                                              
        add     s2,s0,a0               137     149                                          
#print number
        lw      a1,0(s2)               138     150                                                
        li      a0,1                   139     151                                    
        ecall                          140     152                                    
#print " "
        la      a1,str                 141     153                                    
        li      a0,4                   142     154                                    
        ecall                          143     155                                    
        addi    a6,a6,1                144     156                                                    
        blt     a6,a7,printResult      145     157     169     181     193     205     
        lw      ra,0(sp)               221     218     215     212     209     206
        addi    sp,sp,8                222     219     216     213     210     207
        ret                            223     220     217     214     211     208
