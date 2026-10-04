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
    if(waitinglist.isNotEmpty){
    print('waiting list :');
    for (var i = 0; i < waitinglist.length; i++) {
      print('${waitinglist[i]}');
    }
    }else{
      print('waiting list kosong !');
    }

  }
  void lihatpos(){
    print(posa['plat']);
    print(posb['plat']);
    print(posc['plat']);
  }
  void selesaipos(){
    print('Pilih pos yang ingin diselesaikan :\n1. pos A\n2. pos B\n3. pos C');
    stdout.write('Pilihan anda :');
    var inputselesai = int.parse(stdin.readLineSync()!);
    
    switch (inputselesai) {
      case 1:
        
        if (posa['plat']==null){
          print('pos sudah kosong');
        }else {
          print('${posa['plat']} selesai !');
          posa['plat']=null;
          if(waitinglist.isNotEmpty){
            posa['plat']= waitinglist[0];
            waitinglist.removeAt(0);
          }
          
        }
        break;
      case 2:
        
        if (posb['plat']==null){
          print('pos sudah kosong');
        }else {
          print('${posb['plat']} selesai !');
          posb['plat']=null;
          if(waitinglist.isNotEmpty){
            posb['plat']= waitinglist[0];
            waitinglist.removeAt(0);
          }
        }
        break;
      case 3:
        if (posc['plat']==null){
          print('pos sudah kosong');
        }else {
          print('${posc['plat']} selesai !');
          posc['plat']=null;
          if(waitinglist.isNotEmpty){
            posc['plat']= waitinglist[0];
            waitinglist.removeAt(0);
          }
        }  
        break;
      default:
        print('tidak terdapat pilihan tersebut');
        selesaipos();
  }
}   
void keluarapp(){
  exit(0);
}
void validasi(){
  
  while (jalan == false){
    stdout.write('apakah anda ingin melanjutkan ptogram? Y/N = ');
    String inputvalid = stdin.readLineSync()?? '';

    if (inputvalid == 'Y'){
      jalan = true;
    }else if(inputvalid == 'N'){
     exit(0);
    }
  }
  
}
  while(jalan==true){
    tampilmenu();
    stdout.write('Pilih Menu (1/2/3/4/5) :');
    var input = stdin.readLineSync()!;
    switch (input) {
      case '1':
        tambahlist();
        jalan=false;
        validasi();
        break;
      case '2':
        lihatlist();
        jalan=false;
        validasi();
        break;
      case '3':
        lihatpos(); 
        jalan=false;
        validasi();
        break;
      case '4':
        selesaipos();
        jalan=false;
        validasi();
        break;
      case '5':
        keluarapp();  
      default:
       print('tidak ada pilihan tersebut');
       

    }
  }

  
}
