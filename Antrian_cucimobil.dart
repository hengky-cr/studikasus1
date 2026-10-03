import 'dart:ffi';
import 'dart:io';

void main(){
  Map posa={'plat':null};
  Map posb={'plat':null};
  Map posc={'plat':null};

  var jalan = true;

  List waitinglist=[];


  void tampilmenu(){
    print('===============================');
    print('     wash and clean');
    print('===============================');
    print('1.tambah waiting list\n2.lihat waiting list\n3.lihat pos\n4.selesaikan pos\n5.keluar dari aplikasi');
    print('===============================');
  }
  void tambahlist(){
    stdout.write('Masukkan kb :');
    var inputpos = stdin.readLineSync()!;
    if(posa['plat']==null){
      
      posa['plat']=inputpos;
    }else if(posb['plat']== null){
    
      posb['plat']=inputpos;
    }else if (posc['plat']==null){
      
      posc['plat']=inputpos;
    }else {
      waitinglist.add(inputpos);
    }
  }
  void lihatlist(){
    for (var i = 0; i < waitinglist.length; i++) {
      print('${waitinglist[i]}');
    }

  }
  void lihatpos(){
    print(posa['plat']);
    print(posb['plat']);
    print(posc['plat']);
  }
  void selesaipos(){
    print('Pilih pos yang ingin diselesaikan :\n1. pos A\n2. pos B\n3. pos C');
    
    var inputselesai = int.parse(stdin.readLineSync()!);
    
    switch (inputselesai) {
      case 1:
        print('${posa['plat']}');
        if (posa['plat']==null){
          print('inputan sudah kosong');
        }else {
          posa['plat']=null;
          
        }
        break;
      case 2:
        print('${posb['plat']}');
        if (posb['plat']==null){
          print('inputan sudah kosong');
        }else {
          posb['plat']=null;
          
        }
      case 3:
        print('${posc['plat']}');
        if (posc['plat']==null){
          print('inputan sudah kosong');
        }else {
          posc['plat']=null;
        }  
      default:
    }


  }
void keluarapp(){
  exit(0);
}
  while(jalan==true){
    tampilmenu();
    stdout.write('Pilih Menu (1/2/3/4/5) :');
    var input = int.parse(stdin.readLineSync()!);
    switch (input) {
      case 1:
        
        tambahlist();
        break;
      case 2:
        lihatlist();
      case 3:
        lihatpos(); 
      case 4:
        selesaipos();
      case 5:
        keluarapp();  
      default:

    }

  }

  
}