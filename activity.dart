import 'dart:io';

void main() {
  String? storedFirstName;
  String? storedLastName;
  String? storedUsername;
  String? storedPassword;
  String? choice;

  // Welcome message
  print("\n╔═════════════════════════════════════════════════════╗");
  print("║                                                     ║");
  print("║       👋 Welcome to the K&K User System!            ║");
  print("║                                                     ║");
  print("║   We are Kwin and Kassandra, the creators of this   ║");
  print("║         simple terminal-based user system.          ║");
  print("║                                                     ║");
  print("╚═════════════════════════════════════════════════════╝\n");

  stdout.write("👉 Press 'Enter' to continue...");
  stdin.readLineSync(); // Waits for user to press Enter

  print("\n");

  do {
    print("╔════════════════════════════════════════════╗");
    print("║           💼 USER ACCOUNT MENU             ║");
    print("╠════════════════════════════════════════════╣");
    print("║ 1️⃣  Create an account                       ║");
    print("║ 2️⃣  Log in to your account                  ║");
    print("║ 3️⃣  Exit                                    ║");
    print("╚════════════════════════════════════════════╝");
    stdout.write("👉 Enter your choice (1-3): ");
    choice = stdin.readLineSync();

    print("\n");

    switch (choice) {
      case '1': // Create an account
        if (storedFirstName != null &&
            storedLastName != null &&
            storedUsername != null &&
            storedPassword != null) {
          print("\n╔═══════════════════════════════════════════════════╗");
          print("║ ⚠️  You already have an account. Please log in.    ║");
          print("╚═══════════════════════════════════════════════════╝\n");
        } else {
          print("\n╔═════════════════════════════════════════════════════╗");
          print("║               🛠️  Account Creation Process           ║");
          print("╠═════════════════════════════════════════════════════╣");

          stdout.write("  👤 First name: ");
          storedFirstName = stdin.readLineSync();

          stdout.write("  👥 Last name: ");
          storedLastName = stdin.readLineSync();

          // Username input with validation
          // Only alphanumeric characters allowed
          do {
            stdout.write("  🆔 Username (Alphanumeric only): ");
            storedUsername = stdin.readLineSync();
            if (storedUsername == null ||
                storedUsername.trim().isEmpty ||
                !RegExp(r'^[a-zA-Z0-9]+$').hasMatch(storedUsername)) {
              print(
                "\n╔════════════════════════════════════════════════════════════════════════════╗",
              );
              print(
                "║ ❌ Invalid username. Please use only letters and numbers, and don't leave  ║",
              );
              print(
                "║ it empty.                                                                  ║",
              );
              print(
                "╚════════════════════════════════════════════════════════════════════════════╝\n",
              );

              storedUsername = null;
            }
          } while (storedUsername == null);

          // Password input with validation
          // Must be at least 6 characters, contain letters and numbers
          do {
            stdout.write("  🔐 Password (6+ chars, a-z, 0-9): ");
            storedPassword = stdin.readLineSync();
            if (storedPassword == null ||
                storedPassword.trim().isEmpty ||
                storedPassword.length < 6 ||
                !RegExp(
                  r'^(?=.*[a-zA-Z])(?=.*[0-9]).+$',
                ).hasMatch(storedPassword)) {
              print(
                "╔════════════════════════════════════════════════════════════════════════════╗",
              );
              print(
                "║ ❌ Invalid password. Must be at least 6 characters with letters and        ║",
              );
              print(
                "║ numbers.                                                                   ║",
              );
              print(
                "╚════════════════════════════════════════════════════════════════════════════╝",
              );

              storedPassword = null;
            }
          } while (storedPassword == null);

          print("╠═════════════════════════════════════════════════════╣");
          print("  ✅ Account created successfully!                    ");
          print("  👤 Name: $storedFirstName $storedLastName");
          print("  🆔 Username: $storedUsername");
          print("  🎉 You can now log in to your account.");
          print("╚═════════════════════════════════════════════════════╝\n");
        }
        break;
      case '2':
        print("Logging in...");
        if (storedUsername == null || storedPassword == null) {
          print("\n╔═══════════════════════════════════════════════╗");
          print("║ ⚠️  No account found. Please create one first. ║");
          print("╚═══════════════════════════════════════════════╝\n");
        } else {
          stdout.write("  🆔 Username: ");
          String? loginUsername = stdin.readLineSync();

          stdout.write("  🔐 Password: ");
          String? loginPassword = stdin.readLineSync();

          if (loginUsername == storedUsername &&
              loginPassword == storedPassword) {
            String welcomeMessage =
                "✅ Login successful! Welcome, $storedFirstName!";
            print("\n╔═══════════════════════════════════════════════╗");
            print("║ ${welcomeMessage.padRight(44)} ║");
            print("╚═══════════════════════════════════════════════╝\n");
          } else {
            print("\n╔════════════════════════════════════════════╗");
            print("║ ❌ Invalid username or password. Try again. ║");
            print("╚════════════════════════════════════════════╝\n");
          }
        }
        break;
      case '3':
        print("\n╔════════════════════════════════════════════╗");
        print("║ 👋 Exiting the program. Goodbye! See you!  ║");
        print("╚════════════════════════════════════════════╝\n");

        exit(0);
      default:
        print("\n╔════════════════════════════════════════════╗");
        print("║   ⚠️   Invalid choice. Try again.           ║");
        print("╚════════════════════════════════════════════╝\n");
    }
  } while (choice != '4');
}
