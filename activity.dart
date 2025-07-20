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
  stdin.readLineSync(); // waits for user to press Enter

  print("\n");

  do {
    print("\n╔════════════════════════════════════════════╗");
    print("║           💼 USER ACCOUNT MENU             ║");
    print("╠════════════════════════════════════════════╣");
    print("║ 1️⃣  Create an account                       ║");
    print("║ 2️⃣  Log in to your account                  ║");
    print("║ 3️⃣  Delete your account                     ║");
    print("║ 4️⃣  Exit                                    ║");
    print("╚════════════════════════════════════════════╝");
    stdout.write("👉 Enter your choice (1-4): ");
    choice = stdin.readLineSync();

    print("\n");

    switch (choice) {
      case '1': /*Create an account*/
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

          stdout.write("  🆔 Username: ");
          storedUsername = stdin.readLineSync();

          stdout.write("  🔐 Password: ");
          storedPassword = stdin.readLineSync();

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
        // Logic to edit profile
        break;
      case '3':
        print("Deleting your profile...");
        // Logic to delete profile
        break;
      case '4':
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
