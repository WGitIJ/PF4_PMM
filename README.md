# QR Scanner App

Una aplicación móvil desarrollada con Flutter que permite escanear códigos QR y gestionar el historial de escaneos. La aplicación diferencia automáticamente entre URLs HTTP y coordenadas geográficas, ofreciendo funcionalidades específicas para cada tipo.

## 📱 Características

- **Escaneo de códigos QR**: Escanea códigos QR usando la cámara del dispositivo
- **Detección automática de tipo**: Identifica automáticamente si el QR contiene:
  - **URLs HTTP**: Enlaces web que se pueden abrir en el navegador
  - **Coordenadas geográficas**: Ubicaciones que se muestran en mapas
- **Almacenamiento local**: Guarda todos los escaneos en una base de datos SQLite local
- **Visualización de mapas**: Muestra ubicaciones geográficas en Google Maps
- **Gestión de historial**: 
  - Ver historial de escaneos organizados por tipo
  - Eliminar escaneos individuales
  - Eliminar todo el historial
- **Navegación intuitiva**: Interfaz con navegación por pestañas entre mapas y direcciones

## 🛠️ Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo multiplataforma
- **Provider**: Gestión de estado
- **SQLite (sqflite)**: Base de datos local para almacenar escaneos
- **Google Maps Flutter**: Visualización de mapas y ubicaciones
- **Mobile Scanner**: Escaneo de códigos QR
- **URL Launcher**: Abrir URLs en el navegador

## 📋 Requisitos Previos

- Flutter SDK (>=2.16.0 <3.0.0)
- Dart SDK
- Android Studio / Xcode (para desarrollo móvil)
- Una API key de Google Maps (para funcionalidad de mapas)

## 🚀 Instalación

1. **Clonar el repositorio**
   ```bash
   git clone <url-del-repositorio>
   cd PF4_PMM
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Configurar Google Maps API Key**
   - Obtén una API key de Google Maps Platform
   - Para Android: Agrega la clave en `android/app/src/main/AndroidManifest.xml`
   - Para iOS: Agrega la clave en `ios/Runner/AppDelegate.swift`

4. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## 📖 Uso

1. **Escanear un código QR**:
   - Toca el botón flotante de escaneo en la pantalla principal
   - Apunta la cámara hacia un código QR
   - La aplicación detectará automáticamente el contenido

2. **Ver historial**:
   - **Mapas**: Toca la primera pestaña para ver todos los escaneos de coordenadas geográficas
   - **Direcciones**: Toca la segunda pestaña para ver todos los escaneos de URLs

3. **Gestionar escaneos**:
   - Toca un escaneo para abrirlo (URL o mapa según el tipo)
   - Desliza hacia la izquierda en un escaneo para eliminarlo
   - Usa el botón de eliminar en la barra superior para borrar todo el historial

## 📁 Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── models/
│   └── scan_model.dart      # Modelo de datos para los escaneos
├── providers/
│   ├── db_provider.dart     # Proveedor de base de datos SQLite
│   ├── scan_list_provider.dart  # Gestión del estado de los escaneos
│   └── ui_provider.dart     # Gestión del estado de la UI
├── screens/
│   ├── home_screen.dart     # Pantalla principal con navegación
│   ├── scanner_screen.dart  # Pantalla de escaneo QR
│   ├── mapa_screen.dart     # Pantalla de visualización de mapa individual
│   ├── mapas_screen.dart    # Lista de escaneos geográficos
│   └── direccions_screen.dart # Lista de escaneos de URLs
├── widgets/
│   ├── custom_navigatorbar.dart  # Barra de navegación personalizada
│   ├── scan_bottom.dart     # Botón flotante de escaneo
│   └── scan_tiles.dart      # Widgets para mostrar escaneos
└── utils/
    └── utils.dart           # Utilidades varias
```

## 📦 Dependencias Principales

```yaml
dependencies:
  flutter: sdk
  provider: ^6.1.5+1          # Gestión de estado
  sqflite: ^2.4.2              # Base de datos SQLite
  google_maps_flutter: ^2.14.0 # Integración con Google Maps
  mobile_scanner: ^7.1.4       # Escaneo de códigos QR
  url_launcher: ^6.3.2         # Abrir URLs
  path_provider: ^2.1.5        # Acceso a directorios del sistema
```

## 🔧 Configuración Adicional

### Permisos de Cámara

La aplicación requiere permisos de cámara para escanear códigos QR. Estos permisos se configuran automáticamente en:
- **Android**: `android/app/src/main/AndroidManifest.xml`
- **iOS**: `ios/Runner/Info.plist`

### Base de Datos

La base de datos SQLite se crea automáticamente en el directorio de documentos de la aplicación. Los datos se almacenan localmente en el dispositivo.

## 🧪 Testing

Para ejecutar los tests:
```bash
flutter test
```

## 📱 Plataformas Soportadas

- ✅ Android
- ✅ iOS
- ✅ Web (parcial)
- ✅ Linux
- ✅ Windows

## 🤝 Contribuir

Las contribuciones son bienvenidas. Por favor:
1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto es privado y no está publicado en pub.dev.

## 👨‍💻 Autor

Desarrollado como parte del proyecto PF4_PMM.

---

**Nota**: Asegúrate de tener configurada correctamente tu API key de Google Maps para que la funcionalidad de mapas funcione correctamente.
