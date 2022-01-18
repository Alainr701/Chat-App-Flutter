import 'package:chat_app/widgets/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isWriting = false;

  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                child: const Text('A'),
                maxRadius: 18,
                backgroundColor: Colors.orange.shade100,
              ),
              const Text('Chat',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
                physics: const BouncingScrollPhysics(),
                reverse: true,
              ),
            ),
            const Divider(height: 1),
            Container(
              width: double.infinity,
              child: _enviarMensaje(),
            )
          ],
        ));
  }

  Widget _enviarMensaje() {
    return SafeArea(
        child: Row(
      children: [
        Flexible(
          child: TextField(
            onSubmitted: _hadleSubmit,
            controller: _textController,
            onChanged: (value) {
              setState(() {
                _isWriting = true;
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Escribe un mensaje...',
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            focusNode: _focusNode,
          ),
        ),
        ElevatedButton.icon(
          onPressed: _isWriting
              ? () => _hadleSubmit(_textController.text.trim())
              : null,
          icon: const Icon(Icons.send, color: Colors.white),
          label: const Text('Enviar', style: TextStyle(color: Colors.white)),
        )
      ],
    ));
  }

  _hadleSubmit(String text) {
    if (text.isEmpty) return;
    print(text);
    _textController.clear();
    _focusNode.requestFocus();
    // FocusScope.of(context).requestFocus(_focusNode);

    final newMessage = ChatMessage(
      text: text,
      uid: '123',
      animationController: AnimationController(
        duration: const Duration(milliseconds: 1000),
        vsync: this,
      ),
    );

    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _isWriting = false;
    });
  }
  @override
  void dispose() {
    //off
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
