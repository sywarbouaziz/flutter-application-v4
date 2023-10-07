import 'dart:convert';

import 'dart:typed_data';
//import 'dart:html';
//import 'dart:js';
//import 'dart:html';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:provider/provider.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';

class RegistrationProvider extends ChangeNotifier {
  static const String _contractName = "Enr";
  static const String ip = "192.168.94.127";
  static const String port = "7900";
  final String _rpcUrl = "http://$ip:$port";
  final String _wsUrl = "wws://$ip:$port";
  final String privateKey =
      "0xbdba3bacb22a1b834dfd38241a0dbe0fbfb155a21aa701c670795bd33282920b";

  late Web3Client? _client;
  late Credentials? _credentials;
  late DeployedContract? _contract;
  late ContractFunction? _registrationC;
  late ContractFunction? _registrationF;
  late ContractFunction? _getF;
  late ContractFunction? _getC, _getP;
  late ContractFunction? _verify;
  late ContractFunction? _loginC;
  late ContractFunction? _addP;
  late ContractFunction? _loginF, _updatepassword, _updateclient;
  bool loading = true;
  late bool tuu = true;
  final picker = ImagePicker();
  late String? firstName;
  late String? lastName;
  File? selectedImage;
  String? ipfsHash;
  Uint8List? imageData;
  Widget? _imageWidget;

  RegistrationProvider(context) {
    initialize(context);
  }

  initialize(context) async {
    _client = Web3Client(
      _rpcUrl,
      Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsUrl).cast<String>();
      },
    );
    final abiStringFile = await DefaultAssetBundle.of(context)
        .loadString("build/contracts/Enr.json");
    final abiJson = jsonDecode(abiStringFile);
    final abi = jsonEncode(abiJson["abi"]);

    final contractAddress = EthereumAddress.fromHex(
        abiJson["networks"]["1682414574462"]["address"]);
    _credentials = EthPrivateKey.fromHex(privateKey);
    _contract = DeployedContract(
        ContractAbi.fromJson(abi, _contractName), contractAddress);
    _registrationC = _contract!.function("registrationC");
    _registrationF = _contract!.function("registrationF");
    _getF = _contract!.function("getUserF");
    _getC = _contract!.function("getUserC");
    _getP = _contract!.function("getProduct");
    _verify = _contract!.function("userExists");
    _loginC = _contract!.function("loginC");
    _loginF = _contract!.function("loginF");
    _updatepassword = _contract!.function("updatepassword");
    _updateclient = _contract!.function("updateclient");
    _addP = _contract!.function("addP");
  }

  Future<void> addP(String fl, String imagehash, String nomProduct,
      String category, String price, String description) async {
    loading = true;
    notifyListeners();

    await _client!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!,
            function: _addP!,
            parameters: [
              fl,
              imagehash,
              nomProduct,
              category,
              price,
              description
            ]));
    //print("Welll done the Registration");

    print("gooodd product is well registred");

    // get(em);
    loading = false;
    notifyListeners();
  }

  Future<void> updateClient(String iphash, String nom, String prenom,
      String email, BigInt numtel, String add, String pass) async {
    loading = true;
    notifyListeners();

    await _client!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!,
            function: _updateclient!,
            parameters: [iphash, nom, prenom, email, numtel, add, pass]));
    //print("Welll done the Registration");

    print("password well updated");

    // get(em);
    loading = false;
    notifyListeners();
  }

  Future<void> updatePass(String password, String email) async {
    loading = true;
    notifyListeners();

    await _client!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!,
            function: _updatepassword!,
            parameters: [password, email]));
    //print("Welll done the Registration");

    print("password well updated");

    // get(em);
    loading = false;
    notifyListeners();
  }

  Future<void> registringC(String imagehash, String nom, String prenom,
      String email, BigInt numtel, String adresse, String password) async {
    loading = true;
    notifyListeners();

    await _client!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!,
            function: _registrationC!,
            parameters: [
              imagehash,
              nom,
              prenom,
              email,
              numtel,
              adresse,
              password
            ]));
    //print("Welll done the Registration");

    print("goooooddddd");

    // get(em);
    loading = false;
    notifyListeners();
  }

  Future<void> registringF(
      String iphash,
      String nomEnt,
      String email,
      BigInt numtel,
      String addEnt,
      String ethaddress,
      String categorie,
      String password) async {
    loading = true;
    notifyListeners();

    await _client!.sendTransaction(
        _credentials!,
        Transaction.callContract(
            contract: _contract!,
            function: _registrationF!,
            parameters: [
              iphash,
              nomEnt,
              email,
              numtel,
              addEnt,
              ethaddress,
              categorie,
              password
            ]));
    //print("Welll done the Registration");

    print("goooooddddd");

    // get(em);
    loading = false;
    notifyListeners();
  }

  Future<bool> verify(String email) async {
    loading = true;
    final result = await _client!.call(
      contract: _contract!,
      function: _verify!,
      params: [email],
    );

    loading = false;
    notifyListeners();
    return result[0];
  }

  Future<List> getF(String em) async {
    loading = true;
    final result = await _client!.call(
      contract: _contract!,
      function: _getF!,
      params: [em],
    );

    print(result[0] + " " + result[1] + " " + result[2].toString());
    print("coucou chouchou");
    loading = false;
    notifyListeners();
    return result;
  }

  Future<List> getP(String em) async {
    loading = true;
    final result = await _client!.call(
      contract: _contract!,
      function: _getP!,
      params: [em],
    );
    for (int i = 0; i < result[1].length; i++) {
      for (int j = 0; j < 5; j++) {
        print(result[1][i][j]);
      }
      print("These are the Products weel good job yossra");
    }
    // if (result[1][1][0] != null) {
    //   print(result[1][1][0] +
    //       " " +
    //       result[1][1][1] +
    //       " " +
    //       result[1][1][2] +
    //       " ");
    //   print("These are the Products weel good job yossra");
    // }
    loading = false;
    notifyListeners();
    return result;
  }

  Future<List> getC(String em) async {
    loading = true;
    final result = await _client!.call(
      contract: _contract!,
      function: _getC!,
      params: [em],
    );

    print(result[0] + " " + result[1] + " " + result[2].toString());
    print("coucou chouchou");
    loading = false;
    notifyListeners();
    return result;
  }

  Future<bool> loginC(String em, String pass) async {
    loading = true;
    final result = await _client!.call(
      contract: _contract!,
      function: _loginC!,
      params: [em, pass],
    );

    //print(result[0]);
    loading = false;
    notifyListeners();
    return result[0];
  }

  Future<bool> loginF(String em, String pass) async {
    loading = true;
    final result = await _client!.call(
      contract: _contract!,
      function: _loginF!,
      params: [em, pass],
    );

    //print(result[0]);
    loading = false;
    notifyListeners();
    return result[0];
  }
//upload the image or file to ipfs

  Future<void> submitForm() async {
    // Upload image to IPFS and get its hash
    ipfsHash = await uploadToIpfs(selectedImage!);
  }

  Future<String> uploadToIpfs(File file) async {
    final url = Uri.parse('http://192.168.94.127:5000/api/v0/add');
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    final jsonData = json.decode(responseBody);
    print("good uploading is done!!!!");
    print(jsonData['Hash']);

    // imageData = await fetchImageFromIpfs(jsonData['Hash']);
    // print(imageData);
    return jsonData['Hash'];
  }

  Future<File> pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    final selectedImage = File(pickedFile!.path);
    return selectedImage;
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    //final selectedFile = result?.files.single.path != null
    File? selectedFile = result?.files.single.path != null
        ? File(result!.files.single.path!)
        : null;

    // ? File(result!.files.single.path!)
    // : null;
  }

  Future<Uint8List> fetchImageFromIpfs(String ipfsHash) async {
    final url = Uri.parse('https://ipfs.io/ipfs/$ipfsHash');
    final response = await http.get(url);
    print(ipfsHash);
    if (response.statusCode == 200) {
      print("Image well fetched");
      return response.bodyBytes;
    } else {
      print("Failed to fetch image from IPFS: ${response.reasonPhrase}");
      throw Exception(
          'Failed to fetch image from IPFS: ${response.reasonPhrase}');
    }
  }

  Future<void> sendVerificationEmail(
      String recipientEmail, String verificationCode) async {
    // Create a SMTP server configuration
    //final smtpServer = gmail('yosradridi17@gmail.com', 'prepa montfleury');
    final smtpServer = SmtpServer(
      'smtp.gmail.com',
      username: 'gestionfactureonline123@gmail.com',
      password: 'vipnlqiizkqjnfsj',
      ignoreBadCertificate:
          true, // set this to true to disable certificate verification for testing purposes only
    );
    // Create the email message
    final message = Message()
      ..from = Address('yosradridi17@gmail.com', 'Yossra')
      ..recipients.add(recipientEmail)
      ..subject = 'Email Verification'
      ..text = 'Your verification code is: $verificationCode';

    try {
      // Send the email
      final sendReport = await send(message, smtpServer);
      print('Message sent: ${sendReport.toString()}');
    } on MailerException catch (e) {
      print('Message not sent: ${e.toString()}');
      // Handle the exception accordingly
    }
  }
}
