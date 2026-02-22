# NEXI 🤖 | Advanced AI Agent

[![ORCID](https://img.shields.io/badge/ORCID-0009--0001--9838--1117-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0009-0001-9838-1117)
[![Framework: OpenClaw](https://img.shields.io/badge/Framework-OpenClaw-blue)](https://github.com/openclaw)
[![Stack: Flutter-Supabase-PostgreSQL](https://img.shields.io/badge/Stack-Flutter--Supabase--PostgreSQL-teal)](https://supabase.com)

**NEXI** es un agente de inteligencia artificial avanzado, núcleo del ecosistema tecnológico de **3M Technology**. Construido sobre el framework **OpenClaw**, NEXI está diseñado para operar como un asistente autónomo con capacidades de memoria a largo plazo y ejecución de tareas complejas.

## 🚀 Características Principales

* **Arquitectura Soberana:** Implementación en infraestructura propia (Self-hosted) mediante Docker y Nginx.
* **Memoria Semántica:** Gestión de contexto dinámico utilizando **pgvector** en PostgreSQL para una recuperación de información (RAG) eficiente.
* **Integración CD-3M:** Diseñado para interactuar con los módulos de la suite CD-3M (Billing V2, Roturas NX).
* **Interfaz Versátil:** Optimizado para interacción fluida a través de Telegram.

## 🛠️ Stack Tecnológico

* **Engine:** OpenClaw + Kimi 2.5:cloud
* **Database:** PostgreSQL + pgvector (SupaBase/VPS)
* **Deployment:** Docker, PM2, Nginx
* **Environment:** Ubuntu VPS

## 📱 Cliente Flutter (NEXI Assistant)

App móvil para la interfaz de chat NEXI/OpenClaw-NX.

- **Flutter** 3.16+ · **Dart** 3.0+ · **Riverpod** · **go_router** · **Supabase**

### Setup

```bash
cd nexi_assistant
flutter pub get

# Crear .env con credenciales (copia .env.example si no existe)
cp .env.example .env
# Edita .env con SUPABASE_URL y SUPABASE_ANON_KEY

flutter run
```

**Importante:** El archivo `.env` contiene credenciales y **no debe subirse a GitHub**. Está en `.gitignore`.

## 🧬 Identidad Académica y de Desarrollo

Este proyecto forma parte del portafolio de investigación técnica y desarrollo de software de **Milton**.

* **ID de Investigador:** [ORCID 0009-0001-9838-1117](https://orcid.org/0009-0001-9838-1117)
* **Organización:** 3M Technology

## 📄 Licencia

Este proyecto es propiedad privada de 3M Technology. Todos los derechos reservados bajo la visión de soberanía tecnológica.
