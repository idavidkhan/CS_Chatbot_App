# 🤖 Flutter AI Chatbot App

A beautifully designed AI chatbot app built with **Flutter**, powered by free or affordable **AI APIs**. Supports Android

---

## 🔧 Tech Stack

- **Frontend:** Flutter (Android & iOS)
- **Backend (AI):** Any external AI API provider:
  - [Hugging Face Inference API](https://huggingface.co/inference-api) – Free-tier models for chatbots
  - [OpenAI GPT-3.5](https://platform.openai.com/) – via free community proxies (limited access)
  - [OpenRouter.ai](https://openrouter.ai) – Multiple models, some free options
  - [Google PaLM via MakerSuite](https://makersuite.google.com/) – Limited free access with a Google account

---

## 🎨 UI Design Ideas

- Chat bubbles with smooth animations  
- Light/Dark mode toggle  
- User & AI avatars  
- Typing indicator animation  
- App bar with chatbot name, theme toggle, and history access  
- Rounded corners, shadows, gradients for a modern look  

📌 *Tip: Use tools like [Figma](https://www.figma.com/) or [FlutterFlow](https://flutterflow.io/) for prototyping.*

---

## 📦 Essential Flutter Packages

| Package | Purpose |
|--------|---------|
| [`http`](https://pub.dev/packages/http) | API calls |
| [`provider`](https://pub.dev/packages/provider) or [`riverpod`](https://pub.dev/packages/flutter_riverpod) | State management |
| [`flutter_spinkit`](https://pub.dev/packages/flutter_spinkit) | Loading animations |
| [`google_fonts`](https://pub.dev/packages/google_fonts) | Custom fonts |
| [`flutter_chat_ui`](https://pub.dev/packages/flutter_chat_ui) or custom chat widgets | Chat interface |

---

## ⚙️ Setup Instructions

1. **Clone the repository:**
   ```
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   
2. **Clean previous builds (optional but recommended)**
   ```
   flutter clean
   
4. **Install dependencies**
   ```
   flutter pub get
5. **Run the app**
   ```
   flutter run



**🧪 Development Tips**
- Use hot reload frequently during UI development

- Keep your API keys in a secure .env file (use flutter_dotenv)

- Modularize widgets and services for better code maintenance
