-- Adminer 4.8.1 MySQL 5.5.5-10.4.24-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

CREATE DATABASE `mysql` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mysql`;

CREATE TABLE `mdl_block_lmsgg_allow_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор ресурса',
  `name` varchar(30) DEFAULT NULL COMMENT 'наименование ресурса',
  `menuname` varchar(30) DEFAULT NULL COMMENT 'наименование ресурса, которое используется в меню',
  `parentId` int(11) NOT NULL DEFAULT 0 COMMENT 'ресурс-родитель ресурса',
  `url` varchar(50) DEFAULT NULL COMMENT 'url-адрес ресурса',
  `description` varchar(20) DEFAULT NULL COMMENT 'описание ресурса',
  `disp` int(11) NOT NULL DEFAULT 1 COMMENT 'флаг показывающий необходимо ли показывать ресурс при раздаче прав',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT 'тип ресурса: страница, функция, часть другой страницы',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=3276;


CREATE TABLE `mdl_block_lmsgg_basetraining` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `bstrName` varchar(100) NOT NULL COMMENT 'Название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=76 COMMENT='Базы обучения';


CREATE TABLE `mdl_block_lmsgg_chairs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `chrName` varchar(100) NOT NULL COMMENT 'Полное название',
  `chrShortName` varchar(20) DEFAULT NULL COMMENT 'Краткое название',
  `chrInstitute_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор института',
  PRIMARY KEY (`id`),
  KEY `chrInstitute_ID` (`chrInstitute_ID`),
  KEY `chrInstitute_ID_2` (`chrInstitute_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=32 COMMENT='Кафедры';


CREATE TABLE `mdl_block_lmsgg_chairspersons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `chprChair_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор кафедры',
  `chprPerson_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор человека на кафедре',
  `chprDate_ND` date NOT NULL COMMENT 'Дата начала работы на кафедре',
  `chprPost_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор должности на кафедре',
  `chprDate_KD` date DEFAULT NULL COMMENT 'Дата окончания работы на кафедре',
  PRIMARY KEY (`id`),
  KEY `chprChair_ID` (`chprChair_ID`),
  KEY `chprPerson_ID` (`chprPerson_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Люди, работающие на кафедре';


CREATE TABLE `mdl_block_lmsgg_cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `ctsName` varchar(50) NOT NULL COMMENT 'Название населенного пункта',
  `ctsTypeCity` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Тип населенного пункта: 0 - город; 1 - деревня; 2 - поселок',
  `ctsRegionArea_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор области региона',
  `ctsRegion_ID` int(10) unsigned DEFAULT NULL COMMENT 'Область региона, которому принадлежит населенный пункт',
  `ctsCountry_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор страны.',
  `ctsInsCode` varchar(10) DEFAULT NULL COMMENT 'Код города для института',
  PRIMARY KEY (`id`),
  KEY `ctsCountry_ID` (`ctsCountry_ID`),
  KEY `ctsRegion_ID` (`ctsRegion_ID`),
  KEY `ctsRegionArea_ID` (`ctsRegionArea_ID`),
  KEY `ctsTypeCity` (`ctsTypeCity`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=40 COMMENT='Населенные пункты';


CREATE TABLE `mdl_block_lmsgg_contactstype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `cttpName` varchar(50) NOT NULL COMMENT 'Название типа контакта',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=34 COMMENT='Тип контакта с человеком: телефон рабочий, icq, e-mai и т.д.';


CREATE TABLE `mdl_block_lmsgg_converttablefrom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `cntbSourceId` int(10) unsigned NOT NULL COMMENT 'Идентификатор записи в таблице-Источнике',
  `cntbDestId` int(10) unsigned NOT NULL COMMENT 'Идентификатор записив таблице-Преемнике',
  `cntbConvertIndex` int(10) unsigned NOT NULL COMMENT 'Индекс связи (создается программно)',
  `cntbTableName` varchar(200) NOT NULL COMMENT 'Название связи (какая таблица с какой связывается)',
  PRIMARY KEY (`id`),
  KEY `cntbAlienId` (`cntbSourceId`),
  KEY `cntbOurId` (`cntbDestId`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;


CREATE TABLE `mdl_block_lmsgg_converttableto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `cntbSourceId` int(10) unsigned NOT NULL COMMENT 'Идентификатор записи в таблице-Источнике',
  `cntbDestId` int(10) unsigned NOT NULL COMMENT 'Идентификатор записи в таблице-Преемнике',
  `cntbConvertIndex` int(10) unsigned NOT NULL COMMENT 'Индекс связи (создается программно)',
  `cntbTableName` varchar(200) NOT NULL COMMENT 'Название связи (какая таблица с какой связывается)',
  PRIMARY KEY (`id`),
  KEY `cntbAlienId` (`cntbSourceId`),
  KEY `cntbOurId` (`cntbDestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `mdl_block_lmsgg_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `cntName` varchar(100) NOT NULL COMMENT 'Полное название страны',
  `cntShortName` varchar(20) DEFAULT NULL COMMENT 'Краткое название страны',
  `cntPrefix_Eng` varchar(5) DEFAULT NULL COMMENT 'Префикс страны. Например, у России префикс "ru"',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=63 COMMENT='Страны';


CREATE TABLE `mdl_block_lmsgg_curricula` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `crrName` varchar(100) NOT NULL COMMENT 'Название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=20 COMMENT='Учебные планы';


CREATE TABLE `mdl_block_lmsgg_curriculaarchive` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `crarGroup_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор группы',
  `crarCurricula_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор учебного плана для группы в данном семестре',
  `crarSemestre` smallint(5) unsigned NOT NULL COMMENT 'Номер семестра',
  `crarNmb` smallint(5) unsigned NOT NULL COMMENT 'Номер учебного плана в семестре',
  `crarYear` int(10) unsigned DEFAULT NULL COMMENT 'Год действия данного учебного плана для группы',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Архив учебных планов, действующих для групп';


CREATE TABLE `mdl_block_lmsgg_curriculadef` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `crdfSpec_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор специальности',
  `crdfBase_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор базы обучения',
  `crdfSemestre` smallint(5) unsigned NOT NULL COMMENT 'Период времени (семестр)',
  `crdfCurricula_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор плана обучения',
  `crdfQualif_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор квалификации специалиста',
  `crdfTrain_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор базы обучения',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIndex` (`crdfSpec_ID`,`crdfBase_ID`,`crdfSemestre`,`crdfQualif_ID`,`crdfTrain_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=27 COMMENT='Планы обучения по умолчанию';


CREATE TABLE `mdl_block_lmsgg_curriculadef1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `crdfSpec_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор специальности',
  `crdfBase_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор базы обучения',
  `crdfSemestre` smallint(5) unsigned DEFAULT NULL COMMENT 'Период времени (семестр)',
  `crdfCurricula_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор плана обучения',
  `crdfQualif_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор квалификации специалиста',
  `crdsTrain_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор базы обучения',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Планы обучения по умолчанию';


CREATE TABLE `mdl_block_lmsgg_curriculadisc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `crdsCurricula_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор учебного плана',
  `crdsType` tinyint(1) NOT NULL COMMENT 'Тип записи (см. документацию)',
  `crdsType_ID` int(10) unsigned NOT NULL COMMENT 'См. документацию',
  `crdsNumber1` double unsigned DEFAULT NULL COMMENT 'См. документацию',
  `crdsParent_ID` int(10) unsigned DEFAULT NULL COMMENT 'Ссылка на родительскую запись этой же таблицы',
  `crdsOrderNumber` int(11) NOT NULL COMMENT 'Порядковый номер группы или дисциплины в учебном плане',
  `crdsCode` varchar(10) DEFAULT NULL COMMENT 'Префикс или код. Если пусто, брать из Группы или Дисциплины',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=28 COMMENT='Дисциплины на плане обучения';


CREATE TABLE `mdl_block_lmsgg_curriculadiscworks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `crdswrCurriculaDisc_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор плана обучения',
  `crdswrTypeWork_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор типа работы',
  `crdswrNumber1` double unsigned DEFAULT NULL COMMENT 'Значение',
  `crdswrCourse_M_ID` int(10) unsigned DEFAULT NULL COMMENT 'идентификатор курса в учебном плане для конкретного типа работы (таблица «mdl_block_lmsgg_MoodleCourses»)',
  `scale` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=25 COMMENT='Типы работ для дисциплин по плану обучения';


CREATE TABLE `mdl_block_lmsgg_curriculamoodlecourses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `crmdcrCurricula_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор учебного плана (таблица «mdl_block_lmsgg_Curricula»)',
  `crmdcrCourse_M_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор курса в Moodle',
  `crmdcrDisc_ID` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Курсы из MOODLE, привязанные к конкретному учебному плану';


SET NAMES utf8mb4;

CREATE TABLE `mdl_block_lmsgg_discipestimations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `dsedGroupPersons_ID` smallint(5) unsigned NOT NULL COMMENT 'Идентификатор обучения',
  `dsedGroup_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор группы, в которой он был, когда получал оценку',
  `dsedDiscipline_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор дисциплины',
  `dsedSemestre` smallint(5) unsigned NOT NULL COMMENT 'Период времени (семестр), за который получена оценка',
  `dsedTypeWork_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор работы',
  `dsedTeacher_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор преподавателя, поставившего оценку',
  `dsedEstimation` double unsigned NOT NULL COMMENT 'Оценка',
  `dsedEstimationName` varchar(40) CHARACTER SET cp1251 DEFAULT NULL COMMENT 'наименование оценки',
  `dsedDate_E` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Дата получения оценки',
  `dsedQuizId` int(10) NOT NULL COMMENT 'идентификатор теста системы moodle',
  `dsedAttempt_ID` int(10) NOT NULL COMMENT 'идент ификатор попытки сдачи теста',
  `dsedType` int(5) NOT NULL COMMENT 'тип оценки 1 - текущая, 0-перездача',
  `dsedGSE2_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор основной сдачи',
  `dsedGSE2Repeat_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор пересдачи',
  `dsedIsCommit` tinyint(1) NOT NULL COMMENT '== 0 - предмет не сдан (низкая оценка); != 0 - предмет сдан',
  PRIMARY KEY (`id`),
  KEY `dsedAttemptID_Index` (`dsedAttempt_ID`),
  KEY `dsedGroupPersons_ID` (`dsedGroupPersons_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Оценки по дисциплинам';


CREATE TABLE `mdl_block_lmsgg_discipgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `dsgrName` varchar(150) NOT NULL COMMENT 'Название',
  `dsgrCode` varchar(10) DEFAULT NULL COMMENT 'Код группы',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=86 COMMENT='Группы дисциплин';


CREATE TABLE `mdl_block_lmsgg_disciplines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `dscChair_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор кафедры',
  `dscName` varchar(100) NOT NULL COMMENT 'Название',
  `dscCodeDis` varchar(10) NOT NULL COMMENT 'Код (префикс) дисциплины',
  PRIMARY KEY (`id`),
  KEY `dscChair_ID` (`dscChair_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=77 COMMENT='Дисциплины';


CREATE TABLE `mdl_block_lmsgg_discipteachers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `dstcGroup_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор группы',
  `dstcDiscipline_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор дисциплины',
  `dstcPerson_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор преподавателя',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIndex1` (`dstcGroup_ID`,`dstcDiscipline_ID`,`dstcPerson_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Преподаватели, преподающие данную дисциплины группе';


CREATE TABLE `mdl_block_lmsgg_documentstype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `dctpName` varchar(100) NOT NULL COMMENT 'Название документа',
  `dctpTypeDoc` smallint(5) unsigned NOT NULL DEFAULT 0 COMMENT 'Тип: 0 - документ об образовании; 1 - удостоверяющий личность',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=63 COMMENT='Типы документов: диплом, паспорт справки и т.д.';


CREATE TABLE `mdl_block_lmsgg_dscedec` (
  `dId` int(11) NOT NULL,
  `eName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timemod` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `mdl_block_lmsgg_employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `empPerson_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор челловека в учебном учреждении',
  `empChairPerson_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор работы на кафедре (если сотрудник работает на кафедре)',
  `empTypeWork` tinyint(1) NOT NULL COMMENT '== 0  - не работает; != 0 - работает',
  `empDate_ND` date NOT NULL COMMENT 'Дата начала работы в учебном учреждении или на кафедре',
  `empDate_KD` date DEFAULT NULL COMMENT 'Дата окончания работы в учебном учреждении или на кафедре',
  PRIMARY KEY (`id`),
  KEY `empPerson_ID` (`empPerson_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Сотрудники';


CREATE TABLE `mdl_block_lmsgg_establishments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `estName` varchar(100) NOT NULL COMMENT 'Полное название',
  `estShortName` varchar(20) DEFAULT NULL COMMENT 'Краткое название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=33 COMMENT='Образовательные учреждения';


CREATE TABLE `mdl_block_lmsgg_eusers` (
  `id_mdl` int(11) NOT NULL COMMENT 'id пользователя moodle',
  `tab_num` int(11) NOT NULL COMMENT 'табельный номер пользователя в электронном деканате',
  PRIMARY KEY (`id_mdl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='таблица связи пользователей moodle и электронного деканата';


CREATE TABLE `mdl_block_lmsgg_faculties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `fclInstitute_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор учебного учреждения для факультета',
  `fclName` varchar(100) NOT NULL COMMENT 'Полное название',
  `fclShortName` varchar(20) DEFAULT NULL COMMENT 'Краткое название',
  PRIMARY KEY (`id`),
  KEY `fclInstitute_ID` (`fclInstitute_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=108 COMMENT='Факультеты в учебном учреждении';


CREATE TABLE `mdl_block_lmsgg_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grpSpec_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор специальности',
  `grpTrainForm_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор формы обучения',
  `grpBase_ID` int(10) unsigned DEFAULT NULL COMMENT 'На базе какого обучения создана группа',
  `grpDate_ND` date NOT NULL COMMENT 'Дата создания группы',
  `grpKurs` smallint(5) unsigned NOT NULL COMMENT 'Номер курса',
  `grpDate_KD` date DEFAULT NULL COMMENT 'Дата выпуска группы',
  `grpName` varchar(50) NOT NULL COMMENT 'Название группы',
  `grpShablonName` varchar(50) DEFAULT NULL COMMENT 'Шаблон, по которому можно построить название группы',
  `grpSemestre` smallint(5) unsigned NOT NULL COMMENT 'Отчетный период (семестр)',
  `grpQualif_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор квалификации специалиста',
  `grpActive` tinyint(1) NOT NULL COMMENT '== 0 - группа не обучается; != 0 - группа обучается.',
  PRIMARY KEY (`id`),
  KEY `grpSpec_ID` (`grpSpec_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=59 COMMENT='Группы по специальности';


CREATE TABLE `mdl_block_lmsgg_groupscourses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grcrsGroup_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор группы',
  `grcrsCourse_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор мудловского курса',
  PRIMARY KEY (`id`),
  UNIQUE KEY `indexGroupsCourses` (`grcrsGroup_ID`,`grcrsCourse_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=13 COMMENT='Мудловские курсы, относящиеся к группам';


CREATE TABLE `mdl_block_lmsgg_groupscurricula` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grcrGroup_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор группы',
  `grcrSemestre` smallint(5) unsigned NOT NULL COMMENT 'Период времени (семестр)',
  `grcrCurricula_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор учебного плана',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIndex1` (`grcrGroup_ID`,`grcrSemestre`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Индивидуальные планы для групп по семестрам';


CREATE TABLE `mdl_block_lmsgg_groupsdisciplines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grdsGroup_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор группы',
  `grdsDiscipline_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор дисциплины',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIndex` (`grdsGroup_ID`,`grdsDiscipline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Какие дисциплины ведутся у групп';


CREATE TABLE `mdl_block_lmsgg_groupsnames` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grnmKurs` smallint(5) unsigned NOT NULL COMMENT 'Курс',
  `grnmGroupValue` varchar(10) NOT NULL COMMENT 'Название (номер) для группы',
  `grnmSemestre` smallint(5) unsigned NOT NULL COMMENT 'Семестр',
  `grnmCode` int(10) unsigned NOT NULL COMMENT 'тип формулы',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=20 COMMENT='Названия для групп по курсам';


CREATE TABLE `mdl_block_lmsgg_groupspersons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grprPerson_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор человека',
  `grprGroup_ID` int(10) unsigned DEFAULT NULL COMMENT 'Группа, в котрой учится (учился) человек',
  `grprPersonType` tinyint(1) NOT NULL COMMENT '== 0 - абитуриент; != 0 - студент',
  `grprTypeStudy` tinyint(1) NOT NULL COMMENT '== 0 - не числится в учебном учреждении; != 0 - числится',
  `grprTypeStudy2` smallint(5) unsigned DEFAULT NULL COMMENT 'см. описание в схеме',
  `grprTypeTraining` smallint(5) unsigned DEFAULT NULL COMMENT 'см. описание в схеме',
  `grprDate_ND` date NOT NULL COMMENT 'см. описание в схеме',
  `grprDate_KD` date DEFAULT NULL COMMENT 'см. описание в схеме',
  `grprSemestre` smallint(5) unsigned DEFAULT NULL COMMENT 'см. описание в схеме',
  `grprSpec_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор специальности (см. документацию)',
  `grprQualif_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор квалификации',
  `grprParent_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор студента в хронологии его учебы. См. файл с описанием.',
  `grprNmb` smallint(5) unsigned NOT NULL COMMENT 'Порядковый номер (с единицы) в хронологии учебы студента. См. файл с описанием.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=41 COMMENT='Люди в учебном учреждении (учащиеся, в академе и т.д.)';


CREATE TABLE `mdl_block_lmsgg_groupspersonsarchive` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grprarGroupPerson_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор обучения',
  `grprarGroup_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор группы',
  `grprarKurs` smallint(5) unsigned NOT NULL COMMENT 'Курс, на котором учился студент в группе',
  `grprarSemestre` smallint(5) unsigned NOT NULL COMMENT 'Семестр, на котором учился студент в группе',
  `grprarDate_KD` date NOT NULL COMMENT 'Дата окончания учебы в группе',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='В каких группах учился студент ранее (переходы между группам';


CREATE TABLE `mdl_block_lmsgg_groupspersonsdocs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grprdcGroupPersons_ID` smallint(5) unsigned NOT NULL COMMENT 'Идентификатор записи, в какой группе находится человек',
  `grprdcDoc_ID` smallint(5) unsigned NOT NULL COMMENT 'Идентификатор документа',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIndex` (`grprdcGroupPersons_ID`,`grprdcDoc_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Документы, поданные на данное обучение';


CREATE TABLE `mdl_block_lmsgg_groupspersonspermissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grprprGroupPerson_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор обучения',
  `grprprGSE2_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор сдачи предмета',
  `grprprGSE2Repeat_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор пересдачи предмета',
  `grprprPriznak` tinyint(1) NOT NULL COMMENT 'Признак: сдача или пересдача',
  `grprprPermission` tinyint(1) NOT NULL COMMENT 'Признак допуска',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=19 COMMENT='Таблица, описывающая, какие студенты не допущены до сдачи';


CREATE TABLE `mdl_block_lmsgg_groupsscheduleeducation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grscedGroup_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор группы',
  `grscedSemestre` smallint(5) unsigned NOT NULL COMMENT 'Период времени (семестр), за который строится график',
  `grscedTypeWork_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор работы (сессия, зачет...)',
  `grscedDate_ND` date NOT NULL COMMENT 'Дата начала',
  `grscedDate_KD` date NOT NULL COMMENT 'Дата окончания',
  `grscedCurricula_ID` int(10) unsigned NOT NULL COMMENT 'ССылка на учебный план, \r\nк которому относится данный учебный график',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIndex1` (`grscedGroup_ID`,`grscedSemestre`,`grscedTypeWork_ID`,`grscedDate_ND`,`grscedDate_KD`,`grscedCurricula_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='График учебного процесса для групп (когда сессия, практика и';


CREATE TABLE `mdl_block_lmsgg_groupsscheduleeducation2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `grsced2Group_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор группы',
  `grsced2Semestre` smallint(5) unsigned NOT NULL COMMENT 'Период времени (семестр), за который строится график',
  `grsced2Date_E` datetime NOT NULL COMMENT 'Дата и время начала экзамена, теста и т.д.',
  `grsced2TypeWork_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор типа работы',
  `grsced2Discipline_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор дисциплины',
  `grsced2Name` varchar(100) DEFAULT NULL COMMENT 'Описание',
  `grsced2Date_E2` datetime NOT NULL COMMENT 'Время окончания экзамена, теста и т.д.',
  `grsced2MoodleCourse_ID` int(10) unsigned DEFAULT NULL COMMENT 'идентификатор мудловского курса для данной дисциплины по конкретному семестру',
  `grsced2RatingScale_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор шкалы оценок для данного теста',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueIndex1` (`grsced2Group_ID`,`grsced2Semestre`,`grsced2Discipline_ID`,`grsced2TypeWork_ID`,`grsced2Date_E`,`grsced2Date_E2`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=44 COMMENT='Расписание учебного процесса по дисциплинам';


CREATE TABLE `mdl_block_lmsgg_gse2permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `gse2pGSE2Main_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор основной работы в учебном плане',
  `gse2pGSE2Need_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор работы в учебном плане, которая должна быть сдана ранее',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gse2pGSE2_Index` (`gse2pGSE2Main_ID`,`gse2pGSE2Need_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Какие типы работы должны быть сданы перед тем, как сдавать о';


CREATE TABLE `mdl_block_lmsgg_gse2repeatings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `gse2rSchedule2_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор учебного процесса для дисциплины из таблицы «mdl_block_lmsgg_GroupsScheduleEducation2»',
  `gse2rDate_B` timestamp NULL DEFAULT NULL COMMENT 'Дата начала пересдачи',
  `gse2rDate_E` timestamp NULL DEFAULT NULL COMMENT 'Дата конца пересдачи',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Даная таблица описывает пересдачи дисциплин учебного процесс';


CREATE TABLE `mdl_block_lmsgg_institutions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `insName` varchar(100) NOT NULL COMMENT 'Полное название учреждения',
  `insShortName` varchar(20) DEFAULT NULL COMMENT 'Краткое название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=94 COMMENT='Образовательные учреждения, для которых строится вся эта баз';


CREATE TABLE `mdl_block_lmsgg_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lgsText` varchar(2000) NOT NULL,
  `lgsTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=29;


CREATE TABLE `mdl_block_lmsgg_moodlecourses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `mdcrCourse_M_ID` int(10) unsigned NOT NULL COMMENT 'Ссылка на мудловский курс',
  `mdcrDiscip_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор дисциплины',
  `mdcrSpec_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор специальности',
  `mdcrQualif_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор квалификации у специальности',
  `mdcrRatingScale_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор шкалы оценок для данного теста',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=25 COMMENT='Содержит данные, какие мудловские курсы соответствуют конкре';


CREATE TABLE `mdl_block_lmsgg_persons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `prsInstitute_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентификатор учреждения, в котром учится или работает человек.',
  `prsCitizenShip_ID` int(10) unsigned DEFAULT NULL COMMENT 'Гражданство',
  `prsFirstName` varchar(50) NOT NULL COMMENT 'Имя',
  `prsMiddleName` varchar(50) NOT NULL COMMENT 'Отчество',
  `prsLastName` varchar(50) NOT NULL COMMENT 'Фамилия',
  `prsPeople_M_ID` int(11) DEFAULT NULL COMMENT 'Ссылка на другую систему',
  `prsBirthday` bigint(10) DEFAULT NULL COMMENT 'День рождения',
  `prsSex` tinyint(1) unsigned NOT NULL COMMENT 'Пол: 0 - женщина; != 0 - мужчина',
  `prsMaritalStatus` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT 'Семейное положение: 0 - холост (не замужем); != 0 - женат (замужем)',
  PRIMARY KEY (`id`),
  KEY `Institute_ID` (`prsInstitute_ID`),
  KEY `prsPeople_M_ID` (`prsPeople_M_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=82 COMMENT='Студенты, персонал и т.д.';


CREATE TABLE `mdl_block_lmsgg_personsaddress` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `pradPerson_ID` int(10) unsigned NOT NULL COMMENT 'Человек, проживающий по данному адресу',
  `pradCity_ID` int(10) unsigned DEFAULT NULL COMMENT 'Город проживания',
  `pradPostalIndex` int(10) unsigned DEFAULT NULL COMMENT 'Индекс',
  `pradStreet` varchar(50) DEFAULT NULL COMMENT 'Улица',
  `pradHouse` varchar(10) DEFAULT NULL COMMENT 'Номер дома',
  `pradApartment` smallint(5) unsigned DEFAULT NULL COMMENT 'Номер квартиры',
  `pradComment` varchar(100) DEFAULT NULL COMMENT 'Комментарий',
  `pradTypeAddress` tinyint(1) NOT NULL COMMENT '== 0 - фактический адрес; != 0 - прописка',
  `pradIsAddressStr` tinyint(1) NOT NULL DEFAULT 0 COMMENT '== 0 - адрес берется из ссылок; !=0 - адрес берется из поля pradAddressStr',
  `pradAddressStr` varchar(256) DEFAULT NULL COMMENT 'Адрес в виде строки',
  PRIMARY KEY (`id`),
  KEY `pradPerson_ID` (`pradPerson_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=50 COMMENT='Адреса людей (фактические и прописка)';


CREATE TABLE `mdl_block_lmsgg_personscontacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `prcnContactType_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор типа контакта',
  `prcnPerson_ID` int(10) unsigned NOT NULL COMMENT 'Человек, которому принадлежит данный контакт',
  `prcnName` varchar(100) NOT NULL COMMENT 'Информация о контакте',
  PRIMARY KEY (`id`),
  KEY `prcnPerson_ID` (`prcnPerson_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=35 COMMENT='Контакт человека (телефон, e-mail, icq и т.д.)';


CREATE TABLE `mdl_block_lmsgg_personsdocuments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `prdcPerson_ID` int(10) unsigned NOT NULL COMMENT 'Человек, которому принадлежит данный документ',
  `prdcDocType_ID` int(10) unsigned NOT NULL COMMENT 'Тип принятого документа',
  `prdcEstab_ID` int(10) unsigned DEFAULT NULL COMMENT 'Учреждение, выдавшее данный документ',
  `prdcSerial` varchar(20) DEFAULT NULL COMMENT 'Серийный номер документа',
  `prdcNumber` varchar(50) DEFAULT NULL COMMENT 'Номер документа',
  `prdcDate` bigint(10) DEFAULT NULL COMMENT 'Дата в документе (для паспорта - дата выдачи его; для диплома - год окончания учреждения)',
  `prdcWhoGive` varchar(256) DEFAULT NULL COMMENT 'Кто выдал документ',
  `prdcIsText` tinyint(1) NOT NULL COMMENT '== 0 - документ задан полями; !=0 - документ задан только в текстовом поле "prdcWhoGive"',
  PRIMARY KEY (`id`),
  KEY `prdcPerson_ID` (`prdcPerson_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=61 COMMENT='Документы, принятые от человека';


CREATE TABLE `mdl_block_lmsgg_personsfamily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `prfmPerson_ID` int(10) unsigned NOT NULL COMMENT 'Человек, с которым связан данный объект',
  `prfmSitizenShip_ID` int(10) unsigned DEFAULT NULL COMMENT 'Гражданство',
  `prfmTypeFamily` smallint(5) unsigned NOT NULL COMMENT '==0 - супруг; !=0 - ребенок',
  `prfmFirstName` varchar(50) NOT NULL COMMENT 'Имя',
  `prfmMiddleName` varchar(50) NOT NULL COMMENT 'Отчество',
  `prfmLastName` varchar(50) NOT NULL COMMENT 'Фамилия',
  `prfmBirthday` date DEFAULT NULL COMMENT 'День рождения',
  `prfmSex` tinyint(1) unsigned NOT NULL COMMENT 'Пол: 0 - женщина; != 0 - мужчина',
  `prfmComment` varchar(1000) DEFAULT NULL COMMENT 'Комментарии',
  PRIMARY KEY (`id`),
  KEY `prfmPerson_ID` (`prfmPerson_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Члены семьи';


CREATE TABLE `mdl_block_lmsgg_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `pstName` varchar(100) NOT NULL COMMENT 'Полное название',
  `pstShortName` varchar(20) DEFAULT NULL COMMENT 'Краткое название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Должности людей в учебном заведении: декан, ректор и т.д.';


CREATE TABLE `mdl_block_lmsgg_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор - епрвичный ключ',
  `userId` int(11) NOT NULL COMMENT 'идентификатор пользователя или группы пользователей',
  `userType` int(11) NOT NULL DEFAULT 0 COMMENT 'тип пользователя, 0-группа пользователей, 1- пользователь.',
  `sourceId` int(11) NOT NULL COMMENT 'идентификатор ресурса на который предоставляются права',
  `allow` int(11) NOT NULL COMMENT 'Права доступа на ресурс',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='таблица привилегий доступа к ресурсам lmsgg';


CREATE TABLE `mdl_block_lmsgg_privileges_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор записи',
  `name` varchar(50) NOT NULL COMMENT 'наименование группы',
  `userId` int(20) NOT NULL COMMENT 'идентификатор пользователя состоящего в группе',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;


CREATE TABLE `mdl_block_lmsgg_qualifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `qlfName` varchar(50) NOT NULL COMMENT 'Название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=28 COMMENT='Квалификации у специальностей';


CREATE TABLE `mdl_block_lmsgg_ratingscale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `rtscGroupNum` smallint(5) unsigned NOT NULL COMMENT 'Номер группы от 1',
  `rtscProcent` double unsigned NOT NULL COMMENT 'Процент, обозначающий оценку',
  `rtscEstim` double NOT NULL COMMENT 'Оценка для данного процента сдачи',
  `rtscName` varchar(40) DEFAULT NULL COMMENT 'наименование оценки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=50 COMMENT='Шкала оценок для тестов в зависимости от количества правильн';


CREATE TABLE `mdl_block_lmsgg_regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `rgsName` varchar(100) NOT NULL COMMENT 'Полное название',
  `rgsShortName` varchar(20) DEFAULT NULL COMMENT 'Краткое название',
  `rgsCountry_ID` int(10) unsigned NOT NULL COMMENT 'Страна, которой принадлежит регион',
  PRIMARY KEY (`id`),
  KEY `rgsCountry_ID` (`rgsCountry_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=92 COMMENT='Области и регионы страны';


CREATE TABLE `mdl_block_lmsgg_regionsarea` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `rgarRegion_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор региона, к которому относится район',
  `rgarName` varchar(100) NOT NULL COMMENT 'Название района',
  PRIMARY KEY (`id`),
  KEY `rgarRegion_ID` (`rgarRegion_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Районы в области';


CREATE TABLE `mdl_block_lmsgg_specialities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `spcFacult_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор факультета',
  `spcCodeSpec` varchar(20) DEFAULT NULL COMMENT 'Код специальности',
  `spcPrefix` varchar(10) NOT NULL COMMENT 'Префикс (обозначение) для специальности',
  `spcName` varchar(80) NOT NULL COMMENT 'Название',
  PRIMARY KEY (`id`),
  KEY `spcFacult_ID` (`spcFacult_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=71 COMMENT='Специальности на факультете';


CREATE TABLE `mdl_block_lmsgg_specqualif` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `spqlSpec_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор специальности',
  `spqlQualif_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор квалификации',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Квалификации у специальностей';


CREATE TABLE `mdl_block_lmsgg_trainingforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `trfrTypeForm` smallint(5) unsigned NOT NULL COMMENT 'Типы форм: очная, заочная и т.д.',
  `trfrName` varchar(20) NOT NULL COMMENT 'Название',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=28 COMMENT='Формы обучения: очная, заочная и т.д.';


CREATE TABLE `mdl_block_lmsgg_trainingterm` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `trtrSpec_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор специальности',
  `trtrBase_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор базы обучения',
  `trtrQualif_ID` int(10) unsigned DEFAULT NULL COMMENT 'Идентияикатор квалификации (специализации)',
  `trtrMonths` int(10) unsigned NOT NULL COMMENT 'Число месяцев в обучении',
  `trtrSemestre` int(10) unsigned NOT NULL COMMENT 'Число семестров в обучении',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COMMENT='Срок обучения по специальности или специализации';


CREATE TABLE `mdl_block_lmsgg_typeworks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `tpwrName` varchar(20) NOT NULL COMMENT 'Название',
  `type` int(5) DEFAULT NULL COMMENT 'тип работы. если ==1, то необходима привязка теста moodle',
  `tpwrScaleId` int(5) NOT NULL COMMENT 'шкала оценок соответствующая данной работе',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=36 COMMENT='Типы работ: курсовая, диплом, практика и т.д.';


CREATE TABLE `mdl_block_lmsgg_typeworksfortables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `tpwrtbTypeWork_ID` int(10) unsigned NOT NULL COMMENT 'Идентификатор типа работы',
  `tpwrtbTable` int(10) unsigned NOT NULL COMMENT 'К какой таблице относится (см. описание)',
  `tpwrtbTypeValue` int(10) unsigned NOT NULL COMMENT 'Тип значения в таблице (см. описание)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 AVG_ROW_LENGTH=17 COMMENT='Типы работ для конкретных таблиц (см. описание)';


-- 2025-12-14 10:33:09
