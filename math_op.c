int combi(int n, int k) { //algo opti de K parmis N
    if (k > n) return 0;
    if (k == 0 || k == n) return 1;
    int cmp =  ((n - k) < k) ? n - k : k;
    int out = 1;
    for (int i = 1; i <= cmp; i++) {
        out = out * (n - cmp + i) / i;
    }
    return out;
}


int powe(int a, int b){ //algo naif de l'exponentiation
    int out = 1;
    for (int i = 0; i < b; i++) {
        out *= a;
    }
    return out;
}