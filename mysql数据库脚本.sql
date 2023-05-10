-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_student` (
  `studentNumber` varchar(20)  NOT NULL COMMENT 'studentNumber',
  `password` varchar(20)  NOT NULL COMMENT '��½����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `sex` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthday` varchar(20)  NULL COMMENT '��������',
  `zzmm` varchar(20)  NOT NULL COMMENT '������ò',
  `className` varchar(30)  NOT NULL COMMENT '���ڰ༶',
  `telephone` varchar(20)  NULL COMMENT '��ϵ�绰',
  `photo` varchar(60)  NOT NULL COMMENT '������Ƭ',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  PRIMARY KEY (`studentNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `position` varchar(12)  NOT NULL COMMENT 'ְ��',
  `password` varchar(20)  NOT NULL COMMENT '����',
  `introduction` varchar(2000)  NULL COMMENT '��ʦ���',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_courseInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `jianjie` varchar(500)  NOT NULL COMMENT '�γ̼��',
  `dagan` varchar(1000)  NOT NULL COMMENT '�γ̴��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_kejian` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `title` varchar(40)  NOT NULL COMMENT '�μ�����',
  `path` varchar(50)  NOT NULL COMMENT '�ļ�·��',
  `addTime` varchar(20)  NULL COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `title` varchar(20)  NOT NULL COMMENT '�±���',
  `addTime` varchar(20)  NOT NULL COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `title` varchar(50)  NOT NULL COMMENT '��Ƶ���ϱ���',
  `chapterId` int(11) NOT NULL COMMENT '������',
  `path` varchar(50)  NOT NULL COMMENT '�ļ�·��',
  `addTime` varchar(20)  NOT NULL COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_exercise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `title` varchar(20)  NOT NULL COMMENT 'ϰ������',
  `chapterId` int(11) NOT NULL COMMENT '������',
  `content` varchar(1000)  NOT NULL COMMENT '��ϰ����',
  `addTime` varchar(20)  NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `teacherId` int(11) NOT NULL COMMENT '���ʵ���ʦ',
  `questioner` varchar(20)  NOT NULL COMMENT '������',
  `content` varchar(200)  NOT NULL COMMENT '��������',
  `reply` varchar(200)  NOT NULL COMMENT '�ظ�����',
  `addTime` varchar(20)  NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_homeworkTask` (
  `homeworkId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `teacherObj` int(11) NOT NULL COMMENT '��ʦ',
  `title` varchar(50)  NOT NULL COMMENT '��ҵ����',
  `content` varchar(1000)  NOT NULL COMMENT '��ҵ����',
  `addTime` varchar(20)  NOT NULL COMMENT '����ʱ��',
  PRIMARY KEY (`homeworkId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_homeworkUpload` (
  `uploadId` int(11) NOT NULL AUTO_INCREMENT COMMENT '��¼���',
  `homeworkTaskObj` int(11) NOT NULL COMMENT '��ҵ����',
  `studentObj` varchar(20)  NOT NULL COMMENT '�ύ��ѧ��',
  `homeworkFile` varchar(60)  NOT NULL COMMENT '��ҵ�ļ�',
  `uploadTime` varchar(20)  NOT NULL COMMENT '�ύʱ��',
  `resultFile` varchar(60)  NOT NULL COMMENT '���Ľ���ļ�',
  `pigaiTime` varchar(20)  NOT NULL COMMENT '����ʱ��',
  `pigaiFlag` int(11) NOT NULL COMMENT '�Ƿ�����',
  `pingyu` varchar(80)  NULL COMMENT '����',
  PRIMARY KEY (`uploadId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_video ADD CONSTRAINT FOREIGN KEY (chapterId) REFERENCES t_chapter(id);
ALTER TABLE t_exercise ADD CONSTRAINT FOREIGN KEY (chapterId) REFERENCES t_chapter(id);
ALTER TABLE t_question ADD CONSTRAINT FOREIGN KEY (teacherId) REFERENCES t_teacher(id);
ALTER TABLE t_homeworkTask ADD CONSTRAINT FOREIGN KEY (teacherObj) REFERENCES t_teacher(id);
ALTER TABLE t_homeworkUpload ADD CONSTRAINT FOREIGN KEY (homeworkTaskObj) REFERENCES t_homeworkTask(homeworkId);
ALTER TABLE t_homeworkUpload ADD CONSTRAINT FOREIGN KEY (studentObj) REFERENCES t_student(studentNumber);


