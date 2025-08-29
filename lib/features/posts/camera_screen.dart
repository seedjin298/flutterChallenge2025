import 'package:camera/camera.dart';
import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;
  bool _isFlashMode = false;

  late CameraController _cameraController;

  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 100),
  );

  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 0.8).animate(_buttonAnimationController);

  void _onGoBack(List<XFile>? images) {
    Navigator.of(context).pop(images);
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) return;

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 0 : 1],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController.initialize();
    setState(() {});
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    if (!cameraDenied) {
      _hasPermission = true;
      await initCamera();
      setState(() {});
    }
  }

  void _onStartTakePhoto(TapDownDetails _) {
    if (_cameraController.value.isTakingPicture) return;

    _buttonAnimationController.forward();
  }

  Future<void> _onStopTakePhoto() async {
    _buttonAnimationController.reverse();

    final image = await _cameraController.takePicture();
    final images = [image];

    if (!mounted) return;
    _onGoBack(images);
  }

  Future<void> _setFlashMode() async {
    _isFlashMode = !_isFlashMode;
    await _cameraController
        .setFlashMode(_isFlashMode ? FlashMode.always : FlashMode.off);
    setState(() {});
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    setState(() {});
  }

  Future<void> _onPickImagePressed() async {
    final images = await ImagePicker().pickMultiImage(
      limit: 10,
    );

    if (images.isEmpty) return;

    if (!mounted) return;
    _onGoBack(images);
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed &&
        _cameraController.value.isInitialized != true) {
      await initCamera();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    initPermissions();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Center(
          child: GestureDetector(
            onTap: () => _onGoBack([]),
            child: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Initializing...",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive()
                ],
              )
            : Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Sizes.size40),
                            bottomRight: Radius.circular(Sizes.size40),
                          ),
                        ),
                        child: CameraPreview(_cameraController),
                      ),
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        bottom: Sizes.size40,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: _setFlashMode,
                                  icon: Icon(
                                    _isFlashMode
                                        ? Icons.flash_on_rounded
                                        : Icons.flash_off_rounded,
                                    color: _isFlashMode
                                        ? Colors.amber.shade200
                                        : Colors.white,
                                    size: Sizes.size28,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTapDown: _onStartTakePhoto,
                              onTapUp: (details) => _onStopTakePhoto(),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    width: Sizes.size80 + Sizes.size14,
                                    height: Sizes.size80 + Sizes.size14,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: Sizes.size6,
                                      value: 1,
                                    ),
                                  ),
                                  ScaleTransition(
                                    scale: _buttonAnimation,
                                    child: Container(
                                      width: Sizes.size80,
                                      height: Sizes.size80,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    onPressed: _toggleSelfieMode,
                                    icon: Icon(
                                      Icons.autorenew_rounded,
                                      color: Colors.white,
                                      size: Sizes.size28,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          "Camera",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: _onPickImagePressed,
                              child: Text(
                                "Library",
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: Sizes.size20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
      ),
    );
  }
}
