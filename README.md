# 🔐 Segurança em Apps – Projeto Flutter

Este é um projeto Flutter com foco em **boas práticas de segurança para aplicativos móveis**, desenvolvido com a linguagem **Dart**. O app simula uma tela de login com armazenamento seguro de token utilizando a biblioteca `flutter_secure_storage`.

---

## 🎯 Objetivo do Projeto

Refatorar um app anterior ou exemplo simples que utilizava `SharedPreferences` para armazenar tokens e substituí-lo por `flutter_secure_storage`, garantindo maior segurança no armazenamento de dados sensíveis.

---

## ✅ Funcionalidades

- Tela com campos de **email** e **senha**
- **Validação** dos campos obrigatórios
- **Simulação de login** (mock):  
  - Se a senha for `123456`, o app retorna o token `abc123`
- Armazenamento **seguro** do token usando `flutter_secure_storage`
- Exibição de **mensagem de sucesso ou erro**

---

## 🧪 Objetivos Técnicos

- Compreender riscos comuns de segurança em apps móveis
- Aplicar boas práticas de proteção de credenciais
- Utilizar a biblioteca `flutter_secure_storage` com criptografia

---

## 📦 Tecnologias Utilizadas

- **Flutter** 3.x
- **Dart**
- `flutter_secure_storage`
- `flutter_form_builder` *(opcional para validação)*
- `provider` ou `setState` para controle de estado simples

---

## 🚀 Como Executar

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/seguranca-em-apps.git
   cd seguranca-em-apps
   
2. Instale as dependências:
   ```bash
   flutter pub get

3. Execute o projeto:
   ```bash
   flutter run

---

## ✅ Checklist de Entrega
- Tela com campos de email e senha

- Validação dos campos

- Simulação de login e retorno de token

- Armazenamento seguro do token

- Mensagem de sucesso ou erro exibida

---

## 📌 Observações
- O token é armazenado de forma segura com criptografia nativa via flutter_secure_storage.
- Ao realizar logout, o token é apagado da memória segura.
- A simulação de login é local, sem conexão com servidor externo.
