import 'package:hello_world/utils/api_key.dart';

void main(List<String> arguments){
  /*List<int> numeros = [1,2,5,6,7,8];
  numeros.add(9);
  print(numeros);
Map<String, String> users = {};
users['user1']='alex';
print(users);
users['user2']='pepe';
print(users);
users['user3']='jorge';
print(users);
users.remove('user1');
print(users);

var products = <int, String> {
  1:'mac',
  2:'iphone'
};

print(products);

//anadir producto que no existe
products.putIfAbsent(0, () => "macbookpro");
print(products);
//quitar producto que no existe
products.removeWhere((key, value) => key==0);
print(products);
//claves del map como lista
print(products.keys.toList());
print(products.values.toList());

final user = <String, dynamic> {
  "name" : "Alex",
  "lastname": "Moreano",
  "age": 28,
  "email": "alxmroeano@hotmai.com",
  "salary":10000.99,
  "enabled": true,
  "location": {
    "country": "Ecuador",
    "countryCode": "EC",
    "city": "Riobamba",
  },
  "pets":[
    {
      "name": "Socrates",
      "age": 2
    },
     {
      "name": "Negra",
      "age": 2
    },
  ]
};
print("Age: ${user['age']}, email: ${user['email']}");
final location = user['location'];
final country = (location as Map<String, String>) ['country'];
print("Country: $country");
final List<Map<String, Object>> pets = user['pets'];
print(pets.where((element) => element['name'] == "Socrates"));
int counter = 0;
while(counter<=15){
  if(counter%2 == 0){
    print(counter);
  }
  counter++;
}
int res=0,num1 = 33, num2 = 12, c = 1;
do{
  res = res + num1;
  c++;
}while(num2>=c);
print("Respuesta de $num1 * $num2 = $res");
print("Numeros impares");
for(int i = 0; i<=num2; i++){
  if(i%2!=0){
    print(i);
  }
}
//spread
List <int> numberss = [1,2,4,5,6,8];
numberss = [...numberss,20,10,0];
print(numberss);

Map<String, dynamic> json = {
  "name":'alex',
  "lastname": 'moreano'
};
print(json);
json = {
  ...json, 'age': 27, 'country':'ecuador'
};
print(json);
print(sum(2, 3, false));
final birthday = DateTime(1995,3,23);
final birthday2 = DateTime(1997,5,22);
print(calculateAge(birthday: birthday, precision: 3, round: false));
print(calculateAge(birthday: birthday2, precision: 1,round: true));
//clases
final socrates = Pet(name: 'socrates',age: 2);
print(socrates);
*/

final socrates= Cat(name: 'socrates', age: 2, saltar: true);
final nemo= Fish(name: 'nemo', age: 1, nadar:true);
final alex= Tiger(name: 'alex', age: 3, saltar: true, cazadorNocturno: true, peso: 90, altura: 1);

print(socrates);
print(nemo);
print(alex);

}


double calculateAge({
  required DateTime birthday,
  int precision = 5,
  bool round = false,
}){
  final current = DateTime.now();
  final days = current.difference(birthday).inDays;
  final age = days/365;
  
  if(round){
    return age.roundToDouble();
  }
  else{
    return double.parse(age.toStringAsFixed(precision));
  }
}

int sum (int a, int b, bool par){
  if(par){
    return a+b;
  }else{
    return 0;
  }
}

class Pet {
  static int counter = 0;
  String name;
  int age;
  //parametros en el constructor
  Pet({required this.name, required this.age}){
    print('new pet created');
  }


  @override//sobrescribe el comportamiento
  String toString(){
    return 'name: $name, age: $age';
  }

  dynamic setName(name2){
    name2=this.name;
  }

  String getName(){
    return name;
  }
}

class Cat extends Pet with WalkMixin{
  bool saltar;

  Cat({required super.name, required super.age, required this.saltar}){
    print('gato creado');
  }

}

mixin WalkMixin {
  void walk (){
    print('walking..');
  }
}

class Fish extends Pet{
  bool nadar;

  Fish({required super.name, required super.age, required this.nadar}){
    print('pez creado');
  }
}

class Tiger extends Cat{
  bool cazadorNocturno;
  int peso, altura;

  Tiger({required super.name, required super.age, required super.saltar, required this.altura, required this.cazadorNocturno, required this.peso}){
    print('tigre de la familia felino creado');
  }
}