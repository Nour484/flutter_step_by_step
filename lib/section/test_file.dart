
 Future  <void> ten () async {

  print ("ten   starts  ") ;

 await Future.delayed(Duration(seconds: 10), ) ;
 print("Ten done") ;


 }

 Future  <void> three () async {

   print ("three  starts  ") ;

   await  Future.delayed(Duration(seconds: 3), ) ;
   print("three done") ;



 }


   mixin EatInClass {

     eatInClass() {
       print("Hey there I eat in my class ");
     }
   }

   mixin SleepInClass {

     sleepInClass() {
       print("Hey there I sleep in my class ");
     }
   }
   mixin copyTaskInClass {

   sleepInClass (){
     print ("Hey there I copy the Task before  my class ") ;

   }


   }




  class Person with EatInClass , SleepInClass {

    @override
    sleepInClass() {
      print("Hey there I sleep in my home ");
    }


  }
 Future<void>  main() async {
   await ten();
   await three();

   Person Ali = Person();
   Ali
     ..eatInClass()
     ..sleepInClass();


   Person Hazem = Person();
   Hazem
     ..eatInClass()
     ..sleepInClass();


   Cat myCat = Cat() ;
   myCat.makeSound() ;

   Cat cat =Cat() ;
   cat.makeSound() ;

 }


 abstract class Animal {
  makeSound () {
    print ("jjjjjjjjj") ;
  }
}
   class Cat extends Animal {
  // @override
  // makeSound() {
  //  print("Mewwwwwwwwwwww") ;
  // }

 }
