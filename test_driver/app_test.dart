import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  FlutterDriver driver;

  setUpAll(()async{
    //Instancia do driver
    driver = await FlutterDriver.connect();
  });

  tearDownAll((){
    if(driver!=null){
      driver.close();
    }

  });


  //campos de teste cadastro
    var cadastrar = find.text("Não tem conta? Cadastre-se");
    var pagCadastro = find.byType("Cadastro");
    var nomeCadastro = find.byValueKey("key-nome-cadastro");
    var emailCadastro = find.byValueKey("key-email-cadastro");
    var senhaCadastro = find.byValueKey("key-senha-cadastro");
    var button_cadastrar = find.text("cadastrar");
    var pagHome = find.byType("Home");
  //-------------------------------------------------

  group('teste pagina inicial', (){

    test('cadastrarConta', ()async{

      await driver.tap(cadastrar); //Clicar no gestureDetector

      await driver.waitFor(pagCadastro); //Verificar se entrou na pagina de cadastro

      await driver.tap(nomeCadastro); //Clicar no nome

      await driver.enterText("jose"); //Colocar o nome

      await driver.tap(emailCadastro); //Clicar no e-mail

      await driver.enterText("jose@jose1234.com.br"); //colocar  o email;

      await driver.tap(senhaCadastro); //Clicar na senha

      await driver.enterText("123456789"); //Colocar a senha

      await driver.tap(button_cadastrar); //clicar no botão cadastrar

      await driver.waitFor(pagHome); //Verificar se entrou na pagina home

      assert(pagHome !=null);

      await driver.waitUntilNoTransientCallbacks(); //Testar que não há mais chamadas
    });

    //campos de teste login

        ///Voltar para a tela anterior
      var button_voltarCadastro = find.byTooltip('Back');
      var button_voltarLogin = find.byTooltip('Back');

      var email = find.byValueKey("email-field");
      var senha = find.byValueKey("senha-field");
      var button_entrar = find.text("Entrar");
      var pagLogin = find.byType("Login");
    //-------------------------------------------------

    test("entrar no whatsApp", ()async{

      await driver.tap(button_voltarCadastro);

      await driver.tap(button_voltarLogin);

      await driver.waitFor(pagLogin);

      assert(pagLogin !=null);

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

  });


  //Testes separados

  /*
  test('cadastrarConta', ()async{

    await driver.tap(cadastrar); //Clicar no gestureDetector

    await driver.waitFor(pagCadastro); //Verificar se entrou na pagina de cadastro

    await driver.tap(nomeCadastro); //Clicar no nome

    await driver.enterText("jose"); //Colocar o nome

    await driver.tap(emailCadastro); //Clicar no e-mail

    await driver.enterText("jose@jose.com.br"); //colocar  o email;

    await driver.tap(senhaCadastro); //Clicar na senha

    await driver.enterText("123456789"); //Colocar a senha

    await driver.tap(button_cadastrar); //clicar no botão cadastrar

    await driver.waitFor(pagHome); //Verificar se entrou na pagina home

    assert(pagHome !=null);

    await driver.waitUntilNoTransientCallbacks(); //Testar que não há mais chamadas


  });

  */

  /*
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

   */
}