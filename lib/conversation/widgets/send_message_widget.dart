import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/conversation_details_bloc.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({super.key});

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ConversationDetailBloc, ConversationDetailState>(
        builder: (context, state) => Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: AutofillGroup(
                    child: TextFormField(
                      controller: _messageController,
                      enabled: !state.isSending,
                      maxLines: 5,
                      minLines: 1,
                      decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        hintText: 'Your message',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.edit_note),
                      ),
                      onChanged: (value) => setState(() => _message = value),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ActionChip(
                onPressed: state.isSending || _messageController.text.isEmpty
                    ? null
                    : () => _onSendAction(context),
                label: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSendAction(BuildContext context) {
    FocusScope.of(context).unfocus();

    context
        .read<ConversationDetailBloc>()
        .add(ConversationDetailEvent.sendMessage(_message));
    setState(() {
      _messageController.text = '';
      _message = '';
    });
  }
}
