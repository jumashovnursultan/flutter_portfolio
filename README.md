# 🚀 Flutter Web Portfolio

Красивое портфолио на Flutter Web с тёмной темой, анимациями и responsive дизайном.

## ✨ Особенности

- 🌑 Тёмная тема с cyan/purple акцентами
- ✨ Плавные анимации (flutter_animate)
- 📱 Адаптивный дизайн (mobile + desktop)
- 🔲 Анимированный сетчатый фон
- 💡 Hover эффекты на всех элементах
- 📊 Секции: Hero, Stats, Skills, Projects, Contact
- 🔗 Интеграция url_launcher для соцсетей

## 🛠️ Структура проекта

```
lib/
├── main.dart                    # Точка входа
├── theme/
│   └── app_theme.dart           # Цвета, шрифты, темы
├── models/
│   └── portfolio_data.dart      # 👈 ЗДЕСЬ МЕНЯЙ СВОИ ДАННЫЕ
├── screens/
│   ├── home_screen.dart         # Navbar + layout
│   ├── hero_section.dart        # Главный экран
│   ├── skills_section.dart      # Навыки
│   ├── projects_section.dart    # Проекты
│   └── contact_section.dart     # Контакты
└── widgets/
    ├── common_widgets.dart      # Переиспользуемые виджеты
    └── grid_background.dart     # Анимированный фон
```

## 🚀 Быстрый старт

### 1. Установи зависимости
```bash
flutter pub get
```

### 2. Запусти локально
```bash
flutter run -d chrome
```

### 3. Сборка для продакшна
```bash
flutter build web --release
```

## ✏️ Как настроить под себя

**1. Поменяй личные данные** в `lib/models/portfolio_data.dart`:
```dart
static const name = 'Твоё Имя';          // Имя
static const email = 'you@email.com';     // Email
static const githubUrl = 'https://...';   // GitHub
static const location = 'Город, Страна'; // Локация
static const bio = '...';                // О себе
```

**2. Добавь свои проекты** в том же файле:
```dart
Project(
  title: 'Название приложения',
  description: 'Что делает, какие результаты',
  technologies: ['Flutter', 'Firebase'],
  githubUrl: 'https://github.com/...',
  storeUrl: 'https://play.google.com/...',
  emoji: '🎯',
  category: 'Category',
),
```

**3. Поменяй уровень навыков** (0–100):
```dart
Skill(name: 'Flutter', level: 90, category: 'Mobile'),
```

## ☁️ Деплой (бесплатно)

### Firebase Hosting
```bash
# Установи Firebase CLI
npm install -g firebase-tools

# Войди
firebase login

# Инициализируй (выбери Hosting → папку build/web)
firebase init

# Собери и задеплой
flutter build web --release
firebase deploy
```
Получишь ссылку: `https://yourname.web.app` ✅

### GitHub Pages (альтернатива)
```bash
flutter build web --release --base-href "/portfolio/"
# Скопируй build/web в ветку gh-pages
```

## 📦 Зависимости

| Пакет | Версия | Назначение |
|-------|--------|------------|
| google_fonts | ^6.1.0 | Шрифты Orbitron, Space Grotesk, JetBrains Mono |
| flutter_animate | ^4.5.0 | Плавные анимации |
| url_launcher | ^6.2.4 | Открытие ссылок |

## 🎨 Кастомизация цветов

В `lib/theme/app_theme.dart`:
```dart
static const cyan = Color(0xFF00D4FF);    // Основной акцент
static const purple = Color(0xFF7C3AED);  // Вторичный акцент
static const background = Color(0xFF080B14); // Фон
```

---
Built with 💙 Flutter
