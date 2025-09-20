# gcd
#total: 66
.data
N1: .word 4
N2: .word 8
str1: .string "GCD value of "
str2: .string " and "
str3: .string " is "

.text
main:
        lw       a0, N1             1
        lw       a1, N2             2
        jal      ra, gcd            3

        #print
        mv       a2, a0             40
        lw       a0, N1             41
        lw       a1, N2             42
        jal      ra, printResult    43

        #exit
        li       a0, 10             65
        ecall                       66

gcd:
        sw       ra, 8(sp)          4      11     18     25
        bne      a1, zero, ngcd     5      12     19     26 
        ret                         39     35     31     27

ngcd:
        addi     sp, sp, -16   (4,8)6 (8,4)13(4,0)20
        rem      a2, a0, a1         7      14     21
        mv       a0, a1             8      15     22
        mv       a1, a2             9      16     23
        
        jal      ra, gcd            10     17     24
        lw       ra, 8(sp)          36     32     28
        addi     sp, sp, 16         37     33     29
        ret                         38     34     30


printResult:
        lw       t0, N1             44
        lw       t1, N2             45
        mv       t2, a2             46

        la       a1, str1           47
        li       a0, 4              48
        ecall                       49

        mv       a1, t0             50
        li       a0, 1              51
        ecall                       52

        la       a1, str2           52
        li       a0, 4              53
        ecall                       54

        mv       a1, t1             55
        li       a0, 1              56
        ecall                       57

        la       a1, str3           58
        li       a0, 4              59
        ecall                       60

        mv       a1, t2             61
        li       a0, 1              62
        ecall                       63

        ret                         64

