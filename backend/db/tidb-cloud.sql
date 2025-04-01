-- --------------------------------------------------------
-- 호스트:                          gateway01.ap-northeast-1.prod.aws.tidbcloud.com
-- 서버 버전:                        5.7.28-TiDB-v7.1.3-serverless - TiDB Server (Apache License 2.0) Community Edition, MySQL 5.7 compatible
-- 서버 OS:                        linux
-- HeidiSQL 버전:                  12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 test.participation 구조 내보내기
CREATE TABLE IF NOT EXISTS `participation` (
  `staffId` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `projectId` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `participationRate` float NOT NULL,
  `leadTaskFlag` tinyint(1) DEFAULT '0',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`staffId`,`projectId`) /*T![clustered_index] CLUSTERED */,
  KEY `projectId` (`projectId`),
  CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `test`.`staff` (`staffId`),
  CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`projectId`) REFERENCES `test`.`projects` (`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 test.participation:~9 rows (대략적) 내보내기
INSERT IGNORE INTO `participation` (`staffId`, `projectId`, `participationRate`, `leadTaskFlag`, `createTime`, `updateTime`) VALUES
	('50', '61', 30, 0, '2025-03-25 02:13:35', '2025-03-25 02:13:35'),
	('59', '72', 20, 0, '2025-03-21 14:54:41', '2025-03-21 14:54:45'),
	('60', '29', 25, 0, '2025-03-21 15:14:57', '2025-03-21 15:14:57'),
	('62', '69', 80, 0, '2025-03-21 16:02:27', '2025-03-25 02:16:17'),
	('62', '70', 10, 0, '2025-03-25 01:47:55', '2025-03-25 01:47:55'),
	('63', '36', 10, 1, '2025-03-25 04:00:25', '2025-03-25 04:00:25'),
	('63', '66', 10, 1, '2025-03-21 16:16:31', '2025-03-25 04:00:25'),
	('63', '69', 20, 1, '2025-03-21 16:09:49', '2025-03-25 04:00:25'),
	('63', '70', 50, 1, '2025-03-21 16:09:49', '2025-03-25 04:00:25');

-- 테이블 test.projects 구조 내보내기
CREATE TABLE IF NOT EXISTS `projects` (
  `projectId` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'AUTO_INCREMENT',
  `projectName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`projectId`) /*T![clustered_index] CLUSTERED */,
  UNIQUE KEY `projectName` (`projectName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 test.projects:~84 rows (대략적) 내보내기
INSERT IGNORE INTO `projects` (`projectId`, `projectName`, `department`) VALUES
	('1', '충남산업기술단지 거점기능강화사업(정책기획)', '정책기획본부'),
	('10', '소부장산업 지원체계 구축사업', '기업지원본부'),
	('11', '논산시 해외시장개척단 파견지원사업', '기업지원본부'),
	('12', '창업보육센터운영지원사업', '기업지원본부'),
	('13', '지역혁신거점사업', '기업지원본부'),
	('14', '천안 1인 창조기업 비즈니스센터 지원사업', '기업지원본부'),
	('15', '(충남) 중소기업 밀집지역 위기대응시스템 구축사업 ', '기업지원본부'),
	('16', '산업맞춤형 전문기술 인력양성사업', '첨단산업본부(디스플레이센터)'),
	('17', 'QD 디스플레이 및 차세대 디스플레이 제품화 경쟁력 강화를 위한 핵심 소재부품 기술 개발', '첨단산업본부(디스플레이센터)'),
	('18', '차세대 디스플레이 소재 개발 및 실증 기반 테스트베드 구축사업', '첨단산업본부(디스플레이센터)'),
	('19', '디스플레이 부품·장비 산업 혁신 및 시장 선점을 위한 시제품제작 지원', '첨단산업본부(디스플레이센터)'),
	('2', '(충남)국가혁신클러스터 지원사업(비R&D)', '정책기획본부'),
	('20', '마이크로LED 모듈러 디스플레이 시험·인증 및 표준화 기술 개발', '첨단산업본부(디스플레이센터)'),
	('21', '초실감 디스플레이용 스마트센서모듈 기술지원 플랫폼 구축사업', '첨단산업본부(디스플레이센터)'),
	('22', '플렉서블ㆍ스트레처블 산업 창출을 위한 부착형 디스플레이 기술기반구축사업', '첨단산업본부(디스플레이센터)'),
	('23', '충남 디스플레이 소부장 특화단지 추진단 운영사업', '첨단산업본부(디스플레이센터)'),
	('24', '충남 디스플레이 국가첨단전략산업 특화단지 추진단 운영사업', '첨단산업본부(디스플레이센터)'),
	('25', '국가 R&D 공모사업 컨설팅 지원사업', '첨단산업본부(디스플레이센터)'),
	('26', 'ESS 전지시스템 기능안전성 설계기술 지원사업', '첨단산업본부(배터리화학센터)'),
	('27', '전기차용 폐배터리 재사용 산업화 기술개발', '첨단산업본부(배터리화학센터)'),
	('28', '이차전지 핵심 소재·부품 양산성 검증 플랫폼 구축사업', '첨단산업본부(배터리화학센터)'),
	('29', '자동차 융합부품 세계화 지원사업', '첨단산업본부(첨단모빌리티센터)'),
	('3', '규제자유특구혁신사업(과제발굴 등)', '정책기획본부'),
	('30', '자동차용 반도체 기능안전·신뢰성 산업 혁신기반구축', '첨단산업본부(첨단모빌리티센터)'),
	('31', '고기능 복합소재 기반 일체형 경량 배터리 관리시스템(BMS) 하우징 개발', '첨단산업본부(첨단모빌리티센터)'),
	('32', '자율주행 인지 및 운행안전(SOTIF) 성능검증 기반구축', '첨단산업본부(첨단모빌리티센터)'),
	('33', '(신규)그린 UAM-AAV 핵심부품 시험평기 기반구축', '첨단산업본부(첨단모빌리티센터)'),
	('34', '(신규)금산군 드론 특별자유화 구역 실증 운영 모니터링', '첨단산업본부(첨단모빌리티센터)'),
	('35', '철강산업재도약 기술개발사업(산업공유자산)', '첨단산업본부(첨단금속소재부품센터)'),
	('36', '시군구연고산업육성사업(당진)', '첨단산업본부(첨단금속소재부품센터)'),
	('37', '수소에너지 산업기반 거점 구축', '첨단산업본부(첨단금속소재부품센터)'),
	('38', '탄소중립실증인프라구축', '첨단산업본부(첨단금속소재부품센터)'),
	('39', '그린수소 생산 수전해 부품 개발지원 플랫폼 구축사업 ', '첨단산업본부(첨단금속소재부품센터)'),
	('4', '신산업정책 프로젝트 운영', '정책기획본부'),
	('40', '수소상용차 부품 성능 검증 기반 구축', '그린산업본부(미래자동차센터)'),
	('41', '수소자동차 및 충전소 보급사업', '그린산업본부(미래자동차센터)'),
	('42', '논산시 수소충전소 설치사업', '그린산업본부(미래자동차센터)'),
	('43', '탄소저감 자동차핵심 부품개발(중략)시제품제작', '그린산업본부(미래자동차센터)'),
	('44', '규제자유특구 혁신사업 육성(안착화)', '그린산업본부(미래자동차센터)'),
	('45', '자동차부품기업 혁신지원 사업', '그린산업본부(미래자동차센터)'),
	('46', '미래차전환 종합지원사업', '그린산업본부(미래자동차센터)'),
	('47', '중소기업을 위한 ESG경영 컨설턴트지원서비스 개발', '그린산업본부(미래자동차센터)'),
	('48', '고성능 전기차용 전동화시스템 성능평가 기반구축', '그린산업본부(미래자동차센터)'),
	('49', '미래모빌리티 열관리시스템 성능 검증 기반구축 사업', '그린산업본부(미래자동차센터)'),
	('5', '충남산업기술단지거점기능강화사업(기업지원)', '기업지원본부'),
	('50', '해양수산 창업투자 지원사업', '그린산업본부(그린바이오센터)'),
	('51', '해양바이오 산업화 인큐베이터 장비구축 지원사업', '그린산업본부(그린바이오센터)'),
	('52', '해양수산자원 산업화 육성 지원사업(바이오)', '그린산업본부(그린바이오센터)'),
	('53', '해양바이오 전략소재 메타 플랫폼화 원천기술개발', '그린산업본부(그린바이오센터)'),
	('54', '고기능성 그린바이오 제품경쟁력 향상을위한 시제품 제작지원', '그린산업본부(그린바이오센터)'),
	('55', '천연물 소재 고기능성 그린바이오 기업 생태계 조성', '그린산업본부(그린바이오센터)'),
	('56', '충남에너지센터 운영사업', '그린산업본부(에너지센터)'),
	('57', '스마트에너지플랫폼 FEMS 구축사업', '그린산업본부(에너지센터)'),
	('58', '충청권 분산에너지 대응 에너지기술공유대학 사업', '그린산업본부(에너지센터)'),
	('59', '지역산업맞춤형 인력양성사업(공동훈련센터)', '산업인력개발센터'),
	('6', '시군구연고산업유겅사업(기금연계형_보령/부여)', '기업지원본부'),
	('60', '충남 스타트업기업 청년채용장려지원사업', '산업인력개발센터'),
	('61', '충남 특화산업 혁신성장을 위한 청년지원사업', '산업인력개발센터'),
	('62', '중소기업 연구인력 현장맞춤형 양성지원사업', '산업인력개발센터'),
	('63', '충남중소중견기업 경영자 역량강화 사업', '산업인력개발센터'),
	('64', '(신규)자동차부품제조업 상생협약 확산 지원사업', '산업인력개발센터'),
	('65', '스마트공장 구축지원 사업', '디지털혁신단'),
	('66', '(신규)충남 AS 지원사업', '디지털혁신단'),
	('67', '제조기술융합센터 테스트베드 구축 사업', '디지털혁신단'),
	('68', '지역주도 디지털혁신지원사업', '디지털혁신단'),
	('69', '충청권 디지털품질역량강화사업', '디지털혁신단'),
	('7', '시군구연고산업유겅사업(기금연계형_논산서천)', '기업지원본부'),
	('70', '정보보호지원센터 운영', '디지털혁신단'),
	('71', '지역 ICT 이노베이션스퀘어 확산사업', '디지털혁신단'),
	('72', '지역 자율형 디지털혁신 프로젝트사업', '디지털혁신단'),
	('73', '지역SW서비스사업화지원사업', '디지털혁신단'),
	('74', '지역선도기업사업화지원사업', '디지털혁신단'),
	('75', '디스플레이 혁신공정 플랫폼 구축사업', '디스플레이혁신공정단'),
	('76', '충남디스플레이산업 품질고도화 및 사업화지원사업', '디스플레이혁신공정단'),
	('77', '(신규) 신시장 창출용 OLED 패널제조 및 이를 위한 공정 라이브러리 IP구축', '디스플레이혁신공정단'),
	('79', '(신규)가상증강혼합현실 영상제공을 위한 마이크로 디스플레이 실증 기반구축', '디스플레이혁신공정단'),
	('8', '충남지자체 지식재산창출지원사업', '기업지원본부'),
	('9', '충남지역기업 성장사다리 지원사업', '기업지원본부'),
	('9-1', '충남 지역혁신 선도기업 육성사업', '기업지원본부'),
	('9-2', '충남 스타기업 육성지원사업', '기업지원본부'),
	('9-3', '충남 지역기업 사업화 지원사업', '기업지원본부'),
	('9-4', 'POST-BI 지원사업', '기업지원본부'),
	('9-5', '수출디딤돌 지원사업', '기업지원본부'),
	('9-6', '지역투자생태계조성 지원사업', '기업지원본부');

-- 테이블 test.staff 구조 내보내기
CREATE TABLE IF NOT EXISTS `staff` (
  `staffId` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `userName` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `staffDepartment` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`staffId`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 test.staff:~75 rows (대략적) 내보내기
INSERT IGNORE INTO `staff` (`staffId`, `userName`, `staffDepartment`) VALUES
	('', '', ''),
	('1', '본부장 차남구', '첨단산업본부'),
	('10', '대리 홍성민', '첨단산업본부'),
	('11', '대리 서충완', '첨단산업본부'),
	('12', '사원 하미영', '첨단산업본부'),
	('13', '책임 정윤호', '첨단산업본부'),
	('14', '과장 김재윤', '첨단산업본부'),
	('15', '대리 장문경', '첨단산업본부'),
	('16', '대리 장병화', '첨단산업본부'),
	('17', '대리 송혜진', '첨단산업본부'),
	('18', '사원 박주현', '첨단산업본부'),
	('19', '사원 한태영', '첨단산업본부'),
	('2', '센터장 강성군', '첨단산업본부'),
	('20', '센터장 문기현', '첨단산업본부'),
	('21', '과장 권구현', '첨단산업본부'),
	('22', '대리 이선영', '첨단산업본부'),
	('23', '대리 이다애', '첨단산업본부'),
	('24', '사원 이경환', '첨단산업본부'),
	('25', '센터장 안정선', '첨단산업본부'),
	('26', '차장 양무섭', '첨단산업본부'),
	('27', '대리 이태양', '첨단산업본부'),
	('28', '대리 오현석', '첨단산업본부'),
	('29', '사원 최호승', '첨단산업본부'),
	('3', '차장 조재욱', '첨단산업본부'),
	('30', '사원 정민균', '첨단산업본부'),
	('31', '센터장 배상규', '첨단산업본부'),
	('32', '부장 방태선', '첨단산업본부'),
	('33', '차장 김도경', '첨단산업본부'),
	('34', '과장 백귀현', '첨단산업본부'),
	('35', '대리 최광복', '첨단산업본부'),
	('36', '대리 정경근', '첨단산업본부'),
	('37', '대리 홍승만', '첨단산업본부'),
	('38', '사원 김정훈', '첨단산업본부'),
	('39', '단장 이승열', '혁신지원단'),
	('4', '과장 이주만', '첨단산업본부'),
	('40', '실장 장명재', '혁신지원단'),
	('41', '과장 백보국', '혁신지원단'),
	('42', '대리 박지은', '혁신지원단'),
	('43', '대리 박소희', '혁신지원단'),
	('44', '대리 백은서', '혁신지원단'),
	('45', '실장 손복동', '혁신지원단'),
	('46', '차장 송영호', '혁신지원단'),
	('47', '과장 송은희', '혁신지원단'),
	('48', '대리 홍선재', '혁신지원단'),
	('49', '대리 이치섭', '혁신지원단'),
	('5', '과장 김슬기', '첨단산업본부'),
	('50', '실장 윤수용', '혁신지원단'),
	('51', '차장 최경근', '혁신지원단'),
	('52', '대리 서동현', '혁신지원단'),
	('53', '사원 이효윤', '혁신지원단'),
	('54', '사원 권원일', '혁신지원단'),
	('55', '단장 장용호', '디지털혁신단'),
	('56', '센터장 이광현', '디지털혁신단'),
	('57', '부장 유흥열', '디지털혁신단'),
	('58', '차장 이문목', '디지털혁신단'),
	('59', '차장 박구태', '디지털혁신단'),
	('6', '과장 최희석', '첨단산업본부'),
	('60', '선임 김준호', '디지털혁신단'),
	('61', '선임 최영주', '디지털혁신단'),
	('62', '대리 이  준', '디지털혁신단'),
	('63', '사원 안솔마로', '디지털혁신단'),
	('64', '사원 신지우', '디지털혁신단'),
	('65', '사원 최은선', '디지털혁신단'),
	('66', '센터장 이종진', '디지털혁신단'),
	('67', '책임 정윤호', '디지털혁신단'),
	('68', '과장 김재윤', '디지털혁신단'),
	('69', '대리 장문경', '디지털혁신단'),
	('7', '과장 송민욱', '첨단산업본부'),
	('70', '대리 장병화', '디지털혁신단'),
	('71', '대리 송혜진', '디지털혁신단'),
	('72', '사원 박주현', '디지털혁신단'),
	('73', '사원 한태영', '디지털혁신단'),
	('8', '대리 이학주', '첨단산업본부'),
	('9', '대리 공준오', '첨단산업본부'),
	('﻿staffId', 'userName', 'staffDepartment');

-- 테이블 test.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `passwordHash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` enum('admin','manager') COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`) /*T![clustered_index] CLUSTERED */,
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 test.users:~0 rows (대략적) 내보내기

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
