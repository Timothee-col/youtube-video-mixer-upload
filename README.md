# 🎬 YouTube Video Mixer Upload Pro

[![Python](https://img.shields.io/badge/Python-3.11+-blue.svg)](https://www.python.org/downloads/)
[![Streamlit](https://img.shields.io/badge/Streamlit-1.29.0-FF4B4B.svg)](https://streamlit.io)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

Transform your videos into engaging TikTok/Reels content with AI-powered face recognition and smart clip extraction!

## ✨ Features

### 🎯 Core Features
- **📤 Direct Upload**: Support for MP4, MOV, AVI, WEBM, MKV formats
- **👤 Face Recognition**: Prioritize clips featuring specific people
- **📱 Vertical Format**: Automatic 9:16 conversion for TikTok/Instagram Reels
- **🔍 Smart Analysis**: 3 analysis modes (Fast, Precise, Very Precise)
- **📝 Text Detection**: Avoid or remove overlaid text (logos, subtitles)

### 🎨 Customization
- **🎵 Audio Integration**: Add voiceovers, narration, or background music
- **🖼️ Logo Overlay**: Brand your videos with custom logos
- **🎬 Video Tagline**: Add professional endings
- **🔀 Smart Shuffle**: Intelligent clip alternation from multiple sources
- **✂️ Smart Crop**: Auto-center on detected faces

## 🚀 Quick Start

### Prerequisites
- Python 3.11 or higher
- 4GB+ RAM recommended
- ffmpeg installed on your system

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/youtube-video-mixer-upload.git
cd youtube-video-mixer-upload
```

2. **Create virtual environment**
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. **Install dependencies**
```bash
pip install -r requirements.txt
```

4. **Run the application**
```bash
streamlit run upload_video_mixer.py
```

The app will open in your browser at `http://localhost:8501`

## 📖 Usage Guide

### Step 1: Configuration
- Set output duration (15-600 seconds)
- Choose clips per video (1-50)
- Configure clip duration (2-30 seconds)

### Step 2: Face Recognition (Optional)
- Upload a reference photo
- Adjust sensitivity threshold
- Enable face-only extraction mode

### Step 3: Add Audio (Optional)
- Upload MP3/WAV/M4A files
- Adjust volume and fade effects
- Sync video duration to audio

### Step 4: Branding (Optional)
- Add logo overlay with position control
- Upload tagline video
- Customize opacity and size

### Step 5: Upload Videos
- Select multiple videos
- Automatic format validation
- Real-time processing feedback

### Step 6: Generate
- Click "Create TikTok/Reels Video"
- Monitor progress
- Download final video

## 🛠️ Advanced Features

### Analysis Modes
- **⚡ Fast (1-2 min)**: Quick processing for simple videos
- **🎯 Precise (3-5 min)**: Balanced quality and speed
- **🐌 Very Precise (5-10 min)**: Maximum quality extraction

### Text Management
- **Avoid**: Skip segments with text
- **Crop**: Remove text areas via cropping
- **Inpaint**: AI-powered text removal

### Quality Options
- **Lanczos Resizing**: High-quality video scaling
- **Smart Crop**: Intelligent face-centered framing
- **Force Diversity**: Ensure clip variety

## 🏗️ Project Structure

```
youtube-video-mixer-upload/
├── 📱 Core Application
│   ├── upload_video_mixer.py      # Main Streamlit interface
│   ├── constants.py               # Configuration settings
│   └── utils.py                   # Helper functions
│
├── 🎬 Video Processing
│   ├── video_extractor.py         # Clip extraction
│   ├── video_assembler.py         # Video concatenation
│   ├── video_normalizer.py        # Format normalization
│   └── video_analyzer.py          # Content analysis
│
├── 🔍 Detection Modules
│   ├── face_detector.py           # Face recognition
│   └── text_detector.py           # Text detection
│
└── 📚 Documentation
    ├── README.md                   # This file
    └── PROJECT_STRUCTURE.md       # Detailed architecture
```

## 🔧 Configuration

Edit `constants.py` to customize default settings:

```python
VIDEO_FORMAT = {
    'width': 1080,
    'height': 1920,
    'fps': 30,
    'bitrate': '6000k'
}
```

## 🐛 Troubleshooting

### Face Recognition Not Working
```bash
# Install cmake first
brew install cmake  # macOS
sudo apt-get install cmake  # Ubuntu

# Then install face-recognition
pip install face-recognition
```

### Memory Issues
- Process videos in smaller batches
- Reduce clips per video
- Lower video quality settings

### MoviePy Errors
- Ensure ffmpeg is installed
- Clear temp directory
- Restart the application

## 🚀 Deployment

### Local Deployment
```bash
streamlit run upload_video_mixer.py
```

### Docker Deployment
```bash
docker build -t video-mixer .
docker run -p 8501:8501 video-mixer
```

### Cloud Deployment (Railway/Heroku)
See `deployment_configs/` folder for platform-specific configurations.

## 📊 Performance

- **Processing Speed**: ~1-2 minutes per video (varies by mode)
- **Memory Usage**: 2-4GB for typical usage
- **Output Quality**: 1080x1920 @ 30fps HD

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Streamlit](https://streamlit.io) for the amazing web framework
- [MoviePy](https://zulko.github.io/moviepy/) for video processing
- [face-recognition](https://github.com/ageitgey/face_recognition) for facial detection
- [OpenCV](https://opencv.org/) for computer vision capabilities

## 📧 Contact

Your Name - [@yourtwitter](https://twitter.com/yourtwitter)

Project Link: [https://github.com/yourusername/youtube-video-mixer-upload](https://github.com/yourusername/youtube-video-mixer-upload)

---

Made with ❤️ by [Your Name]
