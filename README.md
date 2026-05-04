# Todoey 📝

A beautiful and simple Todo app built with Flutter for the frontend and Laravel (PHP) for the backend API. Manage your tasks efficiently with a clean, intuitive interface! 🚀

## ✨ Features

- ✅ Add, edit, and delete tasks
- 📱 Cross-platform mobile app (iOS & Android)
- 🌐 RESTful API backend for data persistence
- 🎨 Modern Material Design UI
- 🔄 Real-time task updates
- 📊 Task completion tracking
- 🏷️ Categorize tasks with custom titles

## 🛠️ Tech Stack

### Frontend

- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language
- **Material Design** - UI components

### Backend

- **Laravel** - PHP framework for API
- **MySQL/SQLite** - Database (configurable)
- **Composer** - PHP dependency management

## 📋 Prerequisites

Before running this project, ensure you have the following installed:

- **Flutter SDK** (version 3.0 or higher) - [Installation Guide](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter)
- **PHP** (version 8.0 or higher) - [Download PHP](https://www.php.net/downloads)
- **Composer** - [Installation Guide](https://getcomposer.org/download/)
- **MySQL** or **SQLite** for database
- **Git** for version control

## 🚀 Installation & Setup

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/todoey.git
cd todoey
```

### 2. Backend Setup (Laravel API)

Navigate to the API directory:

```bash
cd todo_api
```

Install PHP dependencies:

```bash
composer install
```

Copy the environment file and configure it:

```bash
cp .env.example .env
```

Edit `.env` file with your database credentials:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=todoey_db
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

Generate application key:

```bash
php artisan key:generate
```

Run database migrations:

```bash
php artisan migrate
```

Start the Laravel development server:

```bash
php artisan serve --host=0.0.0.0 --port=8000
```

The API will be running at `http://localhost:8000`.

### 3. Frontend Setup (Flutter App)

Navigate back to the root directory:

```bash
cd ..
```

Install Flutter dependencies:

```bash
flutter pub get
```

### 4. Configure API Connection

Update the API base URL in `lib/todo_server.dart` if needed (default is `http://10.0.2.2:8000` for Android emulator).

## 📱 Running the App

### For Android:

```bash
flutter run
```

### For iOS (macOS only):

```bash
flutter run
```

### For Web:

```bash
flutter run -d chrome
```

## 📚 API Endpoints

The Laravel API provides the following endpoints:

- `GET /api/tasks` - Retrieve all tasks
- `POST /api/tasks` - Create a new task
- `PUT /api/tasks/{id}` - Update a task
- `DELETE /api/tasks/{id}` - Delete a task

## 🧪 Testing

### Backend Tests

```bash
cd todo_api
php artisan test
```

### Flutter Tests

```bash
flutter test
```

## 🤝 Contributing

Contributions are welcome! 🎉

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

- **Your Name** - [Your GitHub Profile](https://github.com/yourusername)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Laravel community for the robust backend framework
- Material Design for beautiful UI inspiration

---

Made with ❤️ using Flutter and Laravel
