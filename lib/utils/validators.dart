

String? textValidator(String? value, { text = "Introduce el texto requerido" }) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  String? dayValidator(String? value) {
    if (value == null || value.isEmpty || int.parse(value) < 0 || int.parse(value) > 31) {
      return "Introduse un dia valido";
    }
    return null;
  }

  String? monthValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Introduse un mes valido";
    }
    return null;
  }

  String? yearValidator(String? value) {
    if (value == null || value.isEmpty || int.parse(value) < 1920 || int.parse(value) > 2024) {
      return "Introduse un año valido";
    }
    return null;
  }

    String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Introduse tu email";
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return "Introduse un email valido";
    }
    return null;
  }

    String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Introduse tu telefono";
    }
    if (!RegExp(r'^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$')
        .hasMatch(value)) {
      return "Introduse un telefono valido";
    }
    return null;
  }