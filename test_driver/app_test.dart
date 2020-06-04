
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';


void main(){
  FlutterDriver driver;

  setUpAll(()async{

    //Instanci do driver
    driver = await FlutterDriver.connect();
  });

  tearDownAll((){
    if(driver!=null){
      driver.close();
    }
  });


  //campos de teste
  var email = find.byValueKey("email-field");
  var senha = find.byValueKey("senha-field");
  var button_entrar = find.text("Entrar");

  var pagHome = find.byType("Home");

  var cadastrar = find.byType("GestureDetector");

  test("entrar no whatsApp", ()async{

    await driver.tap(email);//Clicar no textField

    await driver.enterText("rafael-kadu-ramon@hotmail.com");//colocar e-mail

    await driver.tap(senha);//Clicar no textField

    await driver.enterText("123456789");//colocar senha

   // await driver.waitForAbsent(button_entrar);//verificar se o botão esta ausente

    await driver.tap(button_entrar); //apertar o botão

    await driver.waitFor(pagHome);

    assert(pagHome != null);

    await driver.waitUntilNoTransientCallbacks(); //Testar que não há mais chamadas

  });
}