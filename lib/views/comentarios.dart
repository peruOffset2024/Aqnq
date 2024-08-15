import 'package:flutter/material.dart';
import 'package:geo_loc/views/Pruebas/nueva_navegacion.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:geo_loc/views/Pruebas/providers/ubicacionProvider.dart';

class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({super.key});

  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  final TextEditingController _commentController = TextEditingController();
  final String _nombre = 'Ricardo';
  String _userComment = '';
  final List<File> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImagesFromGallery() async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null && pickedFiles.isNotEmpty) {
      setState(() {
        _selectedImages
            .addAll(pickedFiles.map((file) => File(file.path)).toList());
      });
    }
  }

  Future<void> _takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
    }
  }

  void _removeImage(File image) {
    setState(() {
      _selectedImages.remove(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = context.watch<LocationUbiProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubicación'),
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewNavigator()),
            ),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                'Bienvenido: $_nombre',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              if (locationProvider.currentPosition == null)
                const CircularProgressIndicator()
              else ...[
                Text(
                  'Latitud: ${locationProvider.currentPosition!.latitude}',
                ),
                Text(
                  'Longitud: ${locationProvider.currentPosition!.longitude}',
                ),
              ],
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingrese su comentario',
                  ),
                  onChanged: (value) => context.read<LocationUbiProvider>().palabraActu(value),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _userComment = _commentController.text;
                    _commentController.clear();
                  });
                },
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 20),
              if (_userComment.isNotEmpty)
                Text(
                  'Comentario enviado: $_userComment',
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic),
                ),
                Text(
                  'Comentario enviado: ${context.watch<LocationUbiProvider>().palabra}',
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic),
                ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _selectedImages.map((image) {
                  return Stack(
                    children: [
                      Image.file(
                        image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.cancel_outlined,
                              color: Colors.white),
                          onPressed: () => _removeImage(image),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _showImagePickerOptions,
        child: const Icon(Icons.image),
      ),
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Tomar Foto'),
                onTap: () {
                  Navigator.pop(context);
                  _takePhoto();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Seleccionar desde la Galería'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImagesFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}