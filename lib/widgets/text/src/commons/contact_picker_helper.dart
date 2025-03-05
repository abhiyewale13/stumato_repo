
import 'package:stumato_march/widgets/text/src/pigeons/messages.pigeon.dart';
import 'package:stumato_march/widgets/text/src/safe/safe_ops.dart';

class ContactPickerHelper {
  ContactPickerInterface? _interface;
  static ContactPickerHelper? _instance;

  static ContactPickerHelper get instance => _instance ??= ContactPickerHelper._();

  ContactPickerHelper._() {
    _interface = ContactPickerInterface();
  }

  Future<SelectedContact?> pickContact() async {
    final res = await safeFuture(() async => await _interface?.selectContact());
    var contactNumberFormatted = res?.phoneNumber;
    contactNumberFormatted =
        contactNumberFormatted?.replaceAll("(", "").replaceAll(")", "").replaceAll("-", "").replaceAll(" ", "");

    return SelectedContact(
      name: res?.name,
      isSelected: res?.isSelected,
      phoneNumber: contactNumberFormatted,
    );
  }
}
