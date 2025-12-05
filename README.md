# be23-1st-team2-DB
⚽ 풋살 매칭 DB 프로젝트 – Futsal-MatchDB

## 누구나 쉽게 참여하는 풋살 매칭 플랫폼  
개인도 팀 없이 경기에 참여하고, 심판과 구장을 한 번에 연결하는 **원스톱 서비스**입니다.

### 사용 기술  
![Java](https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white)  
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=flat-square&logo=Spring%20Boot&logoColor=white)  
![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=flat-square&logo=mariadb&logoColor=white)  
![Git](https://img.shields.io/badge/Git-F05032?style=flat-square&logo=git&logoColor=white)

---

## 📸 스크린샷 / 요구사항 명세  
아래는 요구사항 명세 및 UI/기획 문서 등 스크린샷 예시입니다:

<img src="https://github.com/user-attachments/assets/65b48495-1562-42e3-a374-b9b2c034b471" width="80%" alt="요구사항 명세 1" />

<img src="https://github.com/user-attachments/assets/a7510a36-17f1-4e84-a542-37c766c054d5" width="80%" alt="요구사항 명세 2" />

<img src="https://github.com/user-attachments/assets/b695ed51-72d7-426b-9823-7535e8b602f0" width="80%" alt="요구사항 명세 3" />

---

## 📅 프로젝트 기간  
**2025.01.04 ~ 2025.12.05 (총 11개월)**

## 👥 팀원 소개 (Developers)  

| 이름   | 포지션     | 담당 업무 (Role)         | 주요 기능 구현 |
|--------|-----------|-------------------------|----------------|
| 수림   | Core Logic | 신청 / 환불 / 투표       | - 매칭 신청 및 인원 체크 (최대 18명)  <br>- 매칭 취소 및 환불 로직 (1시간 전)  <br>- 경기 종료 후 POM 투표 |
| 준형   | Core Logic | 심판 / 매칭 / 결제       | - 경기 Open 및 심판 배정  <br>- 매칭 성사(10명 이상) 및 실패 처리  <br>- PG사 연동 결제 및 취소 |
| 건하   | View / Data | 조회 / 마이페이지        | - 경기 목록 조회 (필터링)  <br>- 구장 상세 정보 및 편의시설 조회  <br>- 마이페이지 (각종 내역 조회) |
| 민정   | Auth / Setup| 인증 / 설정             | - 회원가입, 로그인, ID/PW 찾기  <br>- 프로젝트 초기 설정 (README)  <br>- 회원 탈퇴 (Soft Delete) |

---

## 🛠️ 주요 기능 (Key Features)  

### 1. 회원 서비스 (Member)  
- **회원가입/로그인**: 이메일 중복 체크, 계좌번호 등록, ID/PW 찾기 기능  
- **마이페이지**: 본인의 매칭 신청 내역, 결제 내역, POM 선정 횟수 대시보드 제공  

### 2. 매칭 시스템 (Matching)  
- **매칭 신청**: 원하는 시간/구장의 경기에 개인 단위로 신청하며 결제가 동시에 진행됩니다.  
- **자동 매칭 로직**:  
  - **성공**: 경기 1시간 전까지 최소 **10명** 모집 시 `매칭 확정`  
  - **실패**: 10명 미만 시 `매칭 실패` 처리 후 자동 환불  
- **취소/환불**: 경기 시작 1시간 전까지 취소 가능하며 전액 환불  

### 3. 경기 운영 및 심판 (Game & Referee)  
- **심판 기능**: 관리자가 경기를 생성(Open)하고 결과를 관리  
- **POM (Player Of Match)**: 경기 종료 후 참여자 투표를 통해 최고의 플레이어를 선정  

---

## 📂 프로젝트 구조 (WBS 요약)  
<details>  
<summary>👉 전체 일정 보기 (클릭하여 펼치기)</summary>

| 단계     | 기간        | 주요 활동                   | 상태 |
|----------|-------------|------------------------------|------|
| 기획     | 1월 ~ 2월   | 요구사항 분석, 프로젝트 개요 수립, WBS 작성        | ✅   |
| 설계     | 3월 ~ 4월   | 개념/논리 ERD 설계, 테이블 명세서 작성           | ✅   |
| 구축     | 5월         | DB 구축 (DDL), 더미 데이터 적재                   | ✅   |
| 개발     | 6월         | 회원가입, 로그인, 인증 기능 구현                | ✅   |
| 개발     | 7월         | 경기 신청, 취소, 인원 제한 로직 구현             | 🔄   |
| 개발     | 8월         | 매칭 성공/실패 자동화 로직 구현                 | 🔄   |
| 개발     | 9월         | 결제 시스템 연동 및 환불 처리                  | 🔄   |
| 개발     | 10월        | POM 투표 시스템, 경기 목록 필터링               | 📅   |
| 개발     | 11월        | 마이페이지, 각종 내역 조회, 심판 기능           | 📅   |
| 완료     | 12월        | 통합 테스트 및 최종 배포                         | 📅   |

</details>

---

## 💾 데이터베이스 설계 (ERD)  
**주요 테이블 구조**  
- `USERS` : 회원 정보 (PK: seq)  
- `MATCHES` : 경기 정보 (매칭 상태, 시간, 구장)  
- `APPLICATIONS` : 매칭 신청 내역  
- `PAYMENTS` : 결제 및 환불 내역  
- `VOTES` : POM 투표 내역  
- `STADIUMS` : 구장 및 상세 정보  

---

## 🚀 시작 가이드 (Getting Started)  

### Prerequisites  
- JDK 17+  
- MySQL 8.0+  

### Installation  

```bash
# Clone the repository
git clone https://github.com/your-repo/futsal-matching.git

# Navigate to the project directory
cd futsal-matching

# Build the project
./gradlew build

# Run the application
java -jar build/libs/futsal-app.jar
