### ATM Machine
Class `ATMMachine` sebagai parent class yang memiliki `Deposit` class untuk menambah deposit, `Withdraw` class untuk mengambil uang atau withdraw, `BalanceInquiry` class sebagai deposit saat ini. 
Pada void main, pertama masukkan Pin ATM kemudian akan tampil `Welcome to this simple ATM machine` dan pilih menu transaksinya. 
Jika 1 maka masukkan deposit lalu panggil `depositMoney()` untuk menjumlahkan deposit, Jika 2 maka masukkan jumlah withdraw lalu panggil `withdrawMoney()` 
untuk mengambil uang namun apabila deposit <500 atau withdraw > deposit maka uang tidak bisa di withdraw, jika 3 maka panggil `checkBalance()` untuk melihat uang tersimpan, 
Jika 4 maka exit. File [ATMMachine.dart](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-03/kasus/ATMMachine.dart)\
![atm](https://github.com/Fourthten/praxis-academy/blob/master/novice/01-03/kasus/images/atmdart.PNG)

Sumber:\
[Simple ATM](https://eturo.blogspot.com/2012/01/tutorial-simple-atm-machine-program-in.html)