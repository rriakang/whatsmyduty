# myduty

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### **아키텍처 구성요소**

1. **클라이언트 애플리케이션 (Flutter App)**: 사용자는 이 앱을 통해 시간표 이미지를 업로드하고, 처리된 결과를 조회할 수 있습니다.
2. **API 게이트웨이 (Amazon API Gateway)**: 클라이언트의 요청을 적절한 서비스로 라우팅하고, 인증 및 권한 부여를 관리합니다.
3. **인증 서비스 (Amazon Cognito)**: 사용자 인증 및 사용자 관리를 담당합니다.
4. **서버리스 함수 (AWS Lambda)**: 이미지를 처리하고 OCR을 실행하는 로직을 포함합니다. Lambda 함수는 컨테이너 이미지로 배포할 수 있으며, Docker와의 호환성을 제공합니다.
5. **OCR 서비스 (Amazon Textract 또는 Google Tesseract-OCR)**: 이미지에서 텍스트를 추출하는 역할을 합니다. Tesseract-OCR을 사용하는 경우, Lambda에서 Docker 컨테이너를 실행하여 처리할 수 있습니다.
6. **데이터베이스 (Amazon RDS 또는 Amazon DynamoDB)**: 처리된 시간표 데이터를 저장합니다. RDS는 관계형 데이터베이스 서비스를, DynamoDB는 NoSQL 서비스를 제공합니다.
7. **파일 스토리지 (Amazon S3)**: 사용자가 업로드한 시간표 이미지와 OCR 처리 결과를 저장합니다.
8. **알림 서비스 (Amazon SNS 또는 Amazon SES)**: 사용자에게 처리 결과나 중요한 정보를 알리는 데 사용됩니다.

### **배포 및 운영**

- **개발 및 테스트**: 개발 초기 단계에서는 Docker를 활용해 로컬 환경에서 애플리케이션의 모든 컴포넌트를 실행하고 테스트할 수 있습니다.
- **CI/CD 파이프라인 (AWS CodePipeline, AWS CodeBuild)**: 코드 변경사항을 자동으로 감지하고, Docker 이미지를 빌드하며, AWS 서비스에 자동으로 배포합니다.
- **모니터링 및 로깅 (Amazon CloudWatch)**: 시스템의 성능 모니터링과 로그 관리를 위해 CloudWatch를 사용합니다.
