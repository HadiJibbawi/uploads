-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2021 at 12:05 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baydoun`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `chart_of_accounts_id` int(6) NOT NULL,
  `account_number` int(11) DEFAULT NULL,
  `reference_type_id` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT current_timestamp(),
  `date_modified` datetime DEFAULT current_timestamp(),
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `chart_of_accounts_id`, `account_number`, `reference_type_id`, `reference_id`, `balance`, `position_id`, `status_id`, `currency_id`, `date_created`, `date_modified`, `description`) VALUES
(40, 101, 10000001, 2, 1, 0, NULL, 1, 1, '2021-10-24 23:26:39', NULL, NULL),
(41, 101, 10000002, 1, 5, 0, NULL, 2, 1, '2021-10-25 14:47:51', NULL, NULL),
(42, 6, 60001, 2, 34, 34, 0, 0, 1, '2021-10-26 11:20:57', NULL, ''),
(43, 11, 110001, 2, 123, 11, 0, 0, 1, '2021-10-28 14:30:17', NULL, ''),
(44, 101, 10000003, 1, 4, 0, NULL, 2, 1, '2021-10-28 14:33:00', NULL, NULL),
(45, 101, 10000004, 1, 2, 0, NULL, 2, 1, '2021-10-28 14:33:10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `account_positions`
--

CREATE TABLE `account_positions` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_positions`
--

INSERT INTO `account_positions` (`id`, `name`, `description`, `date_created`) VALUES
(1, 'FP - L', '', '2021-10-18 09:43:29'),
(2, 'FP - A', '', '2021-10-18 09:43:29'),
(3, 'FP - A = FP - L', '', '2021-10-24 22:45:53'),
(4, 'IS - E', '', '2021-10-24 22:45:53'),
(5, 'IS - I', '', '2021-10-24 22:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `account_reference_types`
--

CREATE TABLE `account_reference_types` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_reference_types`
--

INSERT INTO `account_reference_types` (`id`, `name`, `description`, `date_created`) VALUES
(1, 'customer', '', '2021-09-04 21:40:20'),
(2, 'supplier', '', '2021-09-04 21:40:20'),
(3, 'sales invoice', 'journal entry resulting from a sales invoice', '2021-10-26 13:42:06'),
(4, 'purchase order', 'journal entry resulting from a purchase order', '2021-10-26 13:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `account_statuses`
--

CREATE TABLE `account_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_statuses`
--

INSERT INTO `account_statuses` (`id`, `name`, `description`, `date_created`) VALUES
(1, 'C', 'Crefit', '2021-10-18 09:42:40'),
(2, 'D', 'Debit', '2021-10-18 09:42:40'),
(3, 'C/D', 'Credit/Debit', '2021-10-18 09:43:00'),
(4, 'C=D', 'Credit=Debit', '2021-10-24 23:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `ledger_id` int(8) NOT NULL,
  `ledger_name_en` varchar(150) NOT NULL,
  `ledger_name_ar` varchar(150) DEFAULT NULL,
  `description_ar` varchar(500) DEFAULT NULL,
  `description_en` varchar(500) DEFAULT NULL,
  `account_status_id` int(11) DEFAULT NULL,
  `account_position_id` int(11) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`ledger_id`, `ledger_name_en`, `ledger_name_ar`, `description_ar`, `description_en`, `account_status_id`, `account_position_id`, `date_created`) VALUES
(1, 'CLASS 1 - EQUITY & LONG TERM DEBTS', 'الفئة الاولى - الرساميل الدائمة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(2, 'CLASS 2 - ACCOUNTS OF FIXED ASSETS', 'الفئة الثانية -  الأصول الثابتة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(3, 'CLASS 3 - INVENTORY & GOODS IN PROCESS', 'الفئة الثالثة - المخزون و قيد الصنع', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(4, 'CLASS 4 - RECEIVABLES & PAYABLES', 'الفئة الرابعة -  حسابات  الذمم', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(5, 'CLASS 5 - FINANCIAL ACCOUNTS', 'الفئة الخامسة - الحسابات  المالية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(6, 'CLASS 6  -  E X P E N D I T U R E', 'الفئة السادسة -  حسابات  الأعباء', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(7, 'CLASS 7 -  I N C O M E', 'الفئة السابعة - حسابات الايرادات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(10, 'CAPITAL', 'رأس  المال', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(11, 'RESERVES', 'الاحتياطيات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(12, 'BROUGHT FORWARD RESULTS', 'نتائج سابقة مدورة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(13, 'NET RESULT OF THE FI. PER.(PRO.or LOSS)', 'النتيجة الصافية للدورة المالية ر. أو  خ.', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(14, 'INVESTMENT SUBSIDIES', 'اعانات للتوظيفات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(15, 'PROVISIONS FOR CONTINGENCIES & CHARGES', 'مؤونات لمواجهة اخطار واعباء', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(16, 'LONG & MEDIUM TERM DEBTS', 'ديون مالية طويلة ومتوسطة الأجل', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(18, 'ACCOUNTS WITH AFFILIATED COMPANIES', 'ح.ارتباط مؤسسات وفروع وشركات المشاركة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(19, 'ACC OF REGROUPING THE CHARGES & INCOME', 'حسابات تجميع الأعباء و الأيرادات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(21, 'INTANGIBLE FIXED ASSETS', 'الأصول الثابتة غير المادية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(22, 'TANGIBLE FIXED ASSETS', 'الاصول الثابتة المادية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(25, 'FINANCIAL FIXED ASSETS', 'الاصول الثابتة المالية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(28, 'DEPRECIATION OF FIXED ASSETS', 'استهلاكات الاصول الثابتة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(29, 'PROVISION FOR DIMUNITION IN VALUE OF F.A', 'مؤونات هبوط اسعار الاصول الثابتة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(31, 'RAW MATERIALS AND CONSUMABLE GOODS', 'مواد اولية او استهلاكية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(33, 'GOODS IN PROCESS (GOODS WORKS SERVICES)', 'قيد الصنع ( سلع واشغال و خدمات )', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(35, 'PRODUCTS', 'منتجـــــات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(37, 'MERCHANDISE FOR SALE', 'البضائــع  ( المعدة للبيع )', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(39, 'P.F.D.IN VALUE OF INV.& GOODS IN PROCESS', 'مؤونات هبوط اسعار المخزون و قيد الصنع', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(40, 'SUPPLIERS', 'الموردون', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(41, 'DEBTORS ( CUSTOMERS )', 'الزبائن', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(42, 'PERSONNEL', 'المستخدمون', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(43, 'SOCIAL SECURITY', 'مؤسسات الضمان الاجتماعي', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(44, 'GOVERNMENT AND PUBLIC INSTITUTIONS', 'الدولة و المؤسسات العامة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(45, 'PARTNERS', 'الشركـــــــاء', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(46, 'MISCELLANEOUS ACC. RECEIVABLE & PAYABLE', 'ذمم مختلفة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(47, 'PRE PAYMENTS & ACCRUALS', 'حسابات التسوية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(48, 'TRANSITORY AND REGULARIZATION ACCOUNT', 'الحسابات المؤقتة  وقيد التسوية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(49, 'PRO. FOR DIMU. IN VALUE OF RECEI.& PAYA.', 'مؤونات لمواجهة هبوط قيم حسابات الذمم', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(50, 'SECURITY PLACEMENTS', 'سندات التوظيف', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(51, 'FINANCIAL INSTITUTIONS', 'المؤسسات المالية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(53, 'C A S H', 'الصنـــدوق', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(58, 'INTERCOMPANY TRANSFERS', 'التحويلات الداخلية', NULL, NULL, 4, 3, '2021-10-24 23:20:28'),
(59, 'PRO. FOR DIM. IN VALUE OF SEC.PLACEMENTS', 'مؤونات هبوط اسعار سندات التوظيف', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(60, 'PURCHASE AND VARIATION OF INVENTORY', 'مشتريات البضاعة وقيمة التغيير في المخزون', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(61, 'PURCHASES RAW MATERIALS & CONSUMABLES', 'مواد اولية و استهلاكية مستخدمة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(62, 'OTHER CHARGES & DISBURSEMENTS', 'اعباء خارجية اخرى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(63, 'PERSONNEL CHARGES', 'اعباء المستخدمين', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(64, 'FEES & TAXES', 'ضرائب و رسوم و مدفوعات مماثلة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(65, 'AMORTIZATION DEPR. & PROV. (OPERATIONAL)', 'مخصصات الأستهلاكات والمؤونات للأستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(66, 'OTHER OPERATING CHARGES', 'أعباء ادارية عادية اخرى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(67, 'FINANCIAL CHARGES', 'الاعباء المالية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(68, 'NON OPPERATING CHARGES', 'اعباء  خارج  الاستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(69, 'INCOME TAX ON FROFITS', 'الضرائب  على الاربـاح', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(70, 'SALES OF GOODS', 'مبيعات البضاعة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(71, 'SALES OF PRODUCTION', 'المنتجات المباعة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(72, 'PROCUCTION  ( VARIATION )', 'الانتاج المخزون ( قيمة التغيير )', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(73, 'PRODUCTION OF FIXED ASSETS', 'منتجات لها طابع الاصول الثابتة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(74, 'OPERATING SUBSIDIES', 'اعانات للأستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(75, 'PROVISIONS WRITE-BACK', 'استردادات من المؤونات - للأستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(76, 'OTHEI OPERATING INCOME', 'ايرادات اخرى ناتجة عن الاستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(77, 'FINANCIAL REVENUES', 'الايرادات  المالية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(78, 'NON OPERATING REVENUES', 'ايرادات خارج الاستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(101, 'Capital ( Company or Individual )', 'راس المال (للشركة او للشخص )', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(102, 'Premiums Related to the Capital', 'علاوات الاصدار والاندماج والمقدمات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(103, 'Revalution Variances', 'فروقات اعادة التخمين', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(109, 'Owners Current Account', 'الحساب الشخصي لصاحب المؤسسة', NULL, NULL, 3, 1, '2021-10-24 23:20:28'),
(111, 'Legal Reserve', 'احتياطي قانوني', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(112, 'Statutary & Contractual Reserve', 'احتياطيات نظامية و تعاقدية', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(119, 'Other Reserves', 'احتياطيات اخرى', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(121, 'Profit Brought Forward', 'نتائج سابقة مدورة دائنة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(125, 'Loss Brought Forward', 'نتائج سابقة مدورة مدينة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(131, 'Gross Trade Margin', 'الهامش التجارى القائم', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(132, 'Value Added', 'القيمة المضافة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(133, 'Gross Trading Operating Margin', 'الفائض غير الصافي للاستثمار', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(134, 'Operating Result (Prior to Fi. In.& Ex.)', 'نتيجةالاستثمار خارج اعباء وايرادات مالية', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(135, 'Result Before Taxation', 'النتيجة الجارية قبل الضريبة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(136, 'Non Operating Result', 'النتيجة خارج الاستثمار', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(138, 'Result of the Period - Profits', 'نتيجة الدورة - ارباح', NULL, NULL, 4, 1, '2021-10-24 23:20:28'),
(139, 'Result of the Period - Losses', 'نتيجة الدورة - خسائر', NULL, NULL, 4, 1, '2021-10-24 23:20:28'),
(141, 'Investment Subsidies Received', 'اعانات للتوظيفات مقبوضة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(145, 'Investment Subsidies Transf. to Results', 'اعانات للتوظيفات  محولة للنتائج', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(151, 'Provisions for Contingencies', 'مؤونات لمواجهة اخطار', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(155, 'Provisions for Charges', 'مؤونات لمواجهة أعباء', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(161, 'Loans Against Debenture', 'قروض لقاء سندات دين', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(162, 'Loans from Financial Institutions', 'قروض  من مؤسسات التسليف', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(168, 'Sundry Loans and Debts', 'قروض  و ديون مختلفة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(181, 'Branches and Joint Ventures Accounts (.)', 'ح.ارتباط م.ف.ش .المشاركة(ح.لكل مؤسسة)', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(186, 'Intercompany Charges', 'أموال وخدمات متبادلة بين الفروع ( أعباء)', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(187, 'Intercompany Income', 'أموال وخدمات متبادلة بين الفروع(ايرادات)', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(191, 'Determination of the Gros Trading margin', 'تحديد الهامش  التجارى القائم', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(192, 'Determination of Value Added', 'تحديد القيمة المضافة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(193, 'Determi. of the Gross Operating Income', 'تحديد الفائض  غير الصافي للأستثمار', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(194, 'D. of Op. Result (Prior to F.I. & Exp)', 'تحديد نتيجة الاستثمارقبل ا. و ا. مالية', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(195, 'D. of the Current Result before Taxation', 'تحديد النتيجة الجارية قبل الضريبة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(196, 'Determination of Non Operating Result', 'تحديد النتيجة خارج الاستثمار', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(197, 'Determination of the Period\'s Result', 'تحديد نتيجة الدورة المالية', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(211, '\"Business Concern (Keymoney', 'Goodwill', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(212, 'Establishment Expenses', 'مصاريف التأسيس', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(213, 'Research and Development Expenses', 'مصاريف البحوث و التطوير', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(214, '\"Patents', ' Licences', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(219, 'Other Intangible Fixed Assets', 'اصول ثابتة غير مادية أخرى', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(221, 'Land', 'الاراضي', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(223, 'Construction', 'الأبنيـــــة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(224, 'Technical Installa. and Industrial Tools', 'التجهيزات الفنية والآلات الصناعية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(226, 'Other Tangible Fixed Assets', 'اصول ثابتة مادية أخرى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(227, 'Tangible Fixed Assets in Progress', 'أصول ثابتة مادية قيد الصنع', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(228, 'Advance Payments on Acc of Tangible F.A.', 'سلفات ودفعات على ح/شراء اصول ثابتة مادية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(251, 'Equity Participations', 'سندات المشاركة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(252, 'Receivables Related to Equity Participa.', 'ذمم مدينة مرتبطة  بمشاركات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(253, 'Other Blocked Securities', 'سندات اخرى مجمدة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(255, 'Long and Medium Term Loans', 'قروض  طويلة و متوسطة الاجل', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(259, 'Other Blocked Long Term Receivables', 'ذمم مدينة اخرى مجمدة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(280, 'Amor. of the Business Concern (Goodwill)', 'استهلاكات المؤسسة التجارية ( الشهرة )', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(281, 'Amortization of Other Intangible F. A.', 'استهلاكات اصول ثابتة غير المادية الاخرى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(282, 'Depreciation of Tangible Fixed Assets', 'استهلاكات الاصول الثابتة المادية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(290, 'P. for D. in Value of Business Concern', 'مؤونات هبوط قيمة  ( المؤسسة التجارية )', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(291, 'Prov. for Dimunition in Value of I. F.A.', 'مؤونات هبوط قيم اصول ثابتة غير المادية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(292, 'Prov. for Dimunition in Value of T. F.A.', 'مؤونات هبوط اسعار الاصول الثابتة المادية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(295, 'Prov.for Dimu.in Value of Financial F.A.', 'مؤونات هبوط اسعار الاصول الثابتة المالية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(311, 'Raw Materials', 'مواد اولية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(315, 'Other Consumable Supplies and Materials', 'مواد ولوازم استهلاكية اخرى', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(331, 'Products in Process', 'منتجات قيد الصنع', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(332, 'Works in Progress', 'اشغال قيد التنفيذ', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(335, 'Studies in Progress', 'دراسات قيد الاعداد', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(336, 'Services in Progress', 'خدمات قيد التقديم', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(351, 'Semi-Finished Goods', 'منتجات وسيطة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(355, 'Manufactured Goods', 'منتجات تامة الصنع', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(358, 'Production Scrap', 'فضلات الانتاج', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(371, 'Opening Inventory', 'مخزون أول المدة ', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(372, 'Closing Inventory', 'مخزون آخر المدة ', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(391, 'P.f.D. in Value of Raw Mat.& Cons. Goods', 'مؤونات هبوط اسعار مخ.مواداوليةواستهلاكية', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(393, 'P.for D. in Value of Products in Process', 'مؤونات هبوط اسعار الانتاج قيد الصنع', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(395, 'P.for D. in Value of Products in Process', 'مؤونات هبوط اسعار الانتاج المخزون', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(397, 'Provisions for Dim.in Value of Inventory', 'مؤونات هبوط اسعار البضاعة المخزونة', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(401, 'Accounts Payables ( Suppliers )', 'ذمم دائنة  ( موردو  الاستثمار )', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(403, 'Fixed Assets Suppliers', 'موردو الاصول الثابتة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(409, 'Advce Pay. on Acc of operational suplies', 'سلفات ودفعات على ح/ طلبيات للأستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(411, 'Invoices', 'فواتير الزبائن', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(413, 'Notes Receivable ( Clients )', 'اوراق قبض  - زبائن', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(415, 'Advances on Works Unbilled', 'ذمم مدينة على اشغال غير منتهية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(418, 'Invoices Under Preparation', 'فواتير قيد الاعداد', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(419, 'Ad & Pay on Ac for ordrs under execution', 'سلفات ومقبوضات على ح/ طلبيات قيد التنفيذ', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(421, 'Payments Due to Personnel', 'مدفوعات متوجبة للمستخدمين', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(428, 'Personnel\'s Accounts Receivable', 'حسابات المستخدمين المدينة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(431, 'Accounts Payable to Social Security', 'ذمم دائنة تجاه مؤسسات الضمان الاجتماعي', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(438, 'Acc Receivable from Social Security fund', 'ذمم مدينة على مؤسسات الضمان الاجتماعي', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(441, 'Taxes Due  ( Operational )', 'ضرائب متوجبة على  الاستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(442, 'الدولة والمؤسسات العامة- الضريبة على القيمة المضافة', 'الدولة والمؤسسات العامة- الضريبة على القيمة المضافة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(443, 'Tax due  ( Non Operational )', 'ضرائب متوجبة خارج الاستثمار', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(445, 'Govt & Pub Institutions Other Ac Payable', 'الدولة والمؤسسات العامة(ذمم دائنة اخرى)', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(449, 'Govt & Public institutions Ac Receivable', 'الدولة والمؤسسات العامة (ذمم مدينة)', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(451, 'Partners Curent Account', 'حسابات الشركاء الجارية المدينةاوالدائنة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(453, 'Dividends Payable', 'انصبة ارباح برسم الدفع', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(455, 'Other Partners Payables', 'ذمم دائنة اخرى للشركاء', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(459, 'Shareholders Receivable', 'ذمم الشركاء المدينة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(461, 'Miscellaneous Operating Acc Payable', 'ذمم الاستثمار الدائنة الاخرى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(463, 'Instalments on Financial Fixed Assets', 'اقساط برسم الدفع  على اصول ثابتة مالية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(465, '\"Miscellaneous Acc Payable', ' Non Operating\"', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(468, 'Misc. Accounts Receivables Operating', 'مدينون مختلفون للأستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(469, 'Miscellaneous Receivable Non Operating', 'مدينون مختلفون  ( خارج الاستثمار )', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(471, 'Deferred Charges', 'الاعباء الواجب توزيعها على عدة دورات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(472, 'Deferred Income', 'اعباء محتسبة مسبقا', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(473, 'Accrued Income', 'ايرادات محتسبة مسبقا', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(481, 'Periodical Allocation of Expenses', 'حسابات التوزيع الدورى للأعباء', NULL, NULL, 4, 3, '2021-10-24 23:20:28'),
(482, 'Periodical Allocation of Income', 'حسابات التوزيع الدورى للأيرادات', NULL, NULL, 4, 3, '2021-10-24 23:20:28'),
(491, 'Pro. for Di. in Value of Recei.(Clients)', 'مؤونات هبوط قيم الذمم المدينة (الزبائن)', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(495, 'Pro. for Dimu. in Value of Partners Acc.', 'مؤونات هبوط قيم حسابات  الشركاء', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(496, 'Pro. for Di.in Values of Misc.Receivable', 'مؤونات هبوط قيم حسابات ذمم مدينة مختلفة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(501, 'Purchases of the Company Own Shares', 'اسهم صادرة عن الشركة ومعادشراؤهامن قبلها', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(502, 'Property Rights Related to Notes', 'سندات تمنح حامليها حق الملكية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(505, 'Debentures and Bonds', 'سندات دين وقسائم صادرة عن الشركة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(506, 'Liabilities Rights Related to Notes', 'سندات تمنح حامليها حقوق الدائنين', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(511, 'Cheques and Coupon for Collection', 'شكات وقسائم برسم  القبض', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(512, 'Banks', 'بنـــوك', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(519, 'Financial Institutions', 'مؤسسات التمويل', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(601, 'Purchases', 'مشتريات البضاعة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(605, 'Variation of Inventory', 'قيمة التغيير  في  مخزون البضاعة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(611, 'Raw Materials & Consumables Purchases', 'مشتريات المواد الأولية و الأستهلاكية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(615, 'Vari. of Raw Mat. & Consumable Inventory', 'قيمة التغيير في مخزون م.اولية واستهلاكية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(621, 'Costs Related to Sub Contracts', 'مشتريات من ملتزمين ثانويين', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(625, 'Leasing and Patents Cost', 'الأتاوى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(626, 'External Services', 'الخدمات الخارجية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(631, 'Salaries & Wages', 'رواتب واجور المستخدمين', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(635, 'Social Security', 'اعباء اجتماعية ( ضمان اجتماعي )', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(641, 'Income Tax on Salaries & Remunerations', 'على الرواتب والاجور وبدلات الاتعاب', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(642, 'Municipal Tax', 'ضرائب ورسوم للبلديات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(643, 'Value Added Tax', 'ضرائب على المبيعات غير قابلة للأسترداد', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(644, 'Registration Fees', 'رسوم تسجيل', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(645, 'Other Taxes', 'ضرائب و رسوم و مدفوعات  مماثلة اخرى', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(651, 'Depreciation & Amortization', 'مخصصات الأستهلاكات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(655, 'Provisions', 'مخصصات المؤونات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(661, 'Other Operating Charges', 'اعباء ادارية اخرى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(665, 'Loss on Joint Venture', 'حصة المؤسسة من الخسائر على عمليات مشتركة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(673, 'Interest', 'فوائد واعباء مشابهة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(675, 'Negative Exchange Differences', 'فروقات صرف سلبية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(676, 'Net Chges on disposal of Sec. Placements', 'أعباءصافيةعلى عمليات تفرغ عن سندات توظيف', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(679, 'Amortization & Pprovisions on Fina.Chges', 'مخصصات الاستهلاكات والمؤونات المالية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(681, 'Net Book Value of Fix.Assets Disposed of', 'القيمةالدفتريةللأصول الثابتةالمتفرغ عنها', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(685, 'Other Charges  - Non Operating', 'اعباء اخرى خارج الاستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(689, 'Depreciation & Provisions Non Operating', 'مخصصات استهلاكات و مؤونات خارج الاستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(701, 'Invoices', 'فواتيــر', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(709, 'Discount & Allowances Allowed', 'حسومات ممنوحة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(711, 'Sales of Production', 'مبيعات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(712, 'Works', 'أشغـــال', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(713, 'Services', 'خدمــات', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(717, 'Proceeds from Ancillary Activities', 'ايرادات النشاطات الفرعية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(719, 'Discount & Allowances Allowed', 'حسومات ممنوحة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(721, 'Works in Process  (Variation)', 'قيد الصنع  ( اموال  )', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(722, '\"Studies & Services in Progress', 'Variation\"', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(725, 'Produced Items (Variations)', 'منتجــات', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(731, 'Intangible Fixed Assets', 'اصول ثابتة غير مادية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(732, 'Tangible Fixed Assets', 'اصول ثابتة مادية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(741, 'Related to Products', 'للبضائع', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(742, 'Related to Production', 'للأنتاج', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(752, 'Write-Back of Pro.for di.in Value of F.A', 'استردادات من مؤونات هبوط اسعاراصول ثابتة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(753, 'Write-Back of Pro.for di.in Value of C.A', 'استرداد من مؤونات هبوط اسعاراصول متداولة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(761, 'Ordinary Incomes', 'ايرادات عادية اخرى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(765, 'Joint Venture Income', 'حصص  ارباح العمليات المشتركة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(771, 'Revenues of Equity Participations', 'ايرادات سندات المشاركة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(772, 'Revenue from Other Assets', 'ايرادات القيم المنقولة الاخرى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(773, 'Interest & Similar Revenues', 'فوائد وايرادات مشابهة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(775, 'Foreign Currencies Positive Difference', 'فروقات صرف ايجابية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(778, 'Other Financial Income', 'ايرادات مالية اخرى', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(779, 'Write-Back of Financial Provisions', 'استردادات من المؤونات المالية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(781, 'Rvenues from Fixed Assets Disposals', 'ايرادات التفرغ عن اصول ثابتة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(782, 'Investm.Subsidies Transfered to P. or L.', 'اعانات للتوظيفات محولة الى نتيجة الدورة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(788, 'Miscellaneous Income Non Operating', 'ايرادات  اخرى خارج الاستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(789, 'Write-Back of Non Operating Provisions', 'استردادات من مؤونات خارج الاستثمار', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(1011, 'Subscribed Capital (Uncalled)', 'راس المال المكتتب غير المستدعى', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1012, 'Subscribed Capital (Called & Unpaid)', 'راس المال المكتتب المستدعى وغير المدفوع', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1013, 'Subscribed Capital (Called & Paid Up)', 'راس المال المكتتب المستدعى و المدفوع', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1021, 'Issue Premiums', 'علاوات الاصدار', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1022, 'Merger Premiums', 'علاوات الاندماج', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1023, 'Contributions Premiums', 'علاوات المقدمات', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1024, 'Premium on converting D.Loans to Shares', 'علاوات تحويل السندات الى اسهم', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1031, 'R. V. of Unamortizable Fixed Assets', 'فروقات اعادة ت ا ث غير القابلةللاستهلاك', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1035, 'R. V. of Amortizable Fixed Assets', 'فروقات اعادة ت ا  ث  القابلة للاستهلاك', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1511, 'P. for Litigation & Sundry Contingencies', 'مؤونات للمنازعات والاحتمالات المختلفة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1512, 'P. in Respect of Gua. given to Customers', 'مؤونات لقاء الضمانات المعطاة للزبائن', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1513, 'Provisions for Losses on Exchange', 'مؤونات خسائر سعر الصرف', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1514, 'Pro. for Losses on Future Transactions', 'مؤونات خسائر على  عقود لأجل', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1515, 'Provisions for Fines and Penalties', 'مؤونات الغرامات و الجزاءات', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1551, 'Provisions for Defferd Charges', 'مؤ.أعباء واجب توزيعهاعلى عدةدورات مالية', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1552, 'P. for Emp. End of Service Indemnities &', 'مؤ.لمواجهة معاشات التقاعد وموجبات مماثلة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1553, 'Provisions for Taxes', 'مؤونات للضرائب', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1681, 'Notes Payable Resulting from Pur.of Ent.', 'أوراق دفع ناجمة عن شراء المؤسسة التجارية', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1682, 'Deposits and Guarantees', 'ودائع و كفالات', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1683, 'Advances from the Government', 'سلفات الدولة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1684, 'Capitalized Life Annuities', 'دخل لمدى الحياة متراكم', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1689, 'Other Medium and Long Term Debts', 'ديون أخرى طويلة ومتوسطة الأجل', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1811, 'Balance Brought Forward', 'رصيد مدور', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(1815, 'Movements of the Period', 'حركات الدورة المالية', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(2198, 'Advance Payments on acc of Intan. F. A.', 'س . و د. على ح/تقديم اصول ث. غير مادية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2211, 'Naked Land', 'الاراضي الفراغ', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2212, 'Built Lands (Real Estate Complexes)', 'الاراضي المبنية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2213, 'Extractive Land Sites (Mines & Quarris)', 'الاراضي برسم الاستثمارالجوفي مناجم مقالع', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2214, 'Land Development and Reclamation', 'استصلاح وتنظيم الاراضي', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2231, 'Buildings', 'الأبنية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2232, 'Ge.Installation & Leasehold Improvements', 'التجهيزات العامة استصلاح وتنظيم ابنية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2233, 'Infrastructure Works (Dams Airp.Runways)', 'انشاءات البنية التحتية سدود مدارج مطارات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2234, 'Construction on Leasehold Land', 'انشاءات على اراضي الغير', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2241, 'Specialized Installations', 'تجهيزات متخصصة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2242, 'Specific Installations', 'تجهيزات ذات طبيعة خاصة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2243, 'Industrial Equipment', 'المعدات الصناعية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2244, 'Industrial Tools', 'الأدوات الصناعية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2251, 'Transportation Equipment', 'آليات النقل', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2252, 'Materiel de transport', 'آليات النقل سياحية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2261, 'Gn. Inst. & Other Improvements & Dvlpmnt', 'تجهيزات عامة استصلاحات وتحسينات مختلفة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2262, 'Office and Computer Equipment', 'ادوات مكتبية و معلوماتية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2263, 'Furniture', 'أثاث', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2264, 'Agricultural Investments', 'استثمارات زراعية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2265, 'Reusable Packing Material', 'عبوات قابلة لأعادة الأستعمال', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2271, 'Land', 'أراضي', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2273, 'Buildings', 'أبنية', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2274, '\"Tech. Inst.', ' Industrial Equip. & Tools\"', NULL, NULL, NULL, 2, '2021-10-24 23:20:28'),
(2276, 'Other Tangible Fixed Assets', 'اصول ثابتة مادية أخرى', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2531, 'Ownership Rights ( Minor Participations)', '\"سندات ملكية (اسهم ', NULL, NULL, NULL, 2, '2021-10-24 23:20:28'),
(2535, 'Debenture Loans (Bonds and Debentures)', '\"سندات دين  ( سندات ', NULL, NULL, NULL, 2, '2021-10-24 23:20:28'),
(2551, 'Loans to Partners', 'قروض  للشركاء', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2552, 'Loans to Employees', 'قروض  للمستخدمين', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2558, 'Other Loans', 'قروض  اخرى', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(2811, 'Establishment Expenses', 'مصاريف التأسيس', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2812, 'Research and Development Expenses', 'مصاريف البحوث و التطوير', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2813, '\"Patents', ' Licences & Similar Values\"', NULL, NULL, NULL, 1, '2021-10-24 23:20:28'),
(2819, 'Other Intangible Fixed Assets', 'اصول ثابتة غير مادية اخرى', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2821, '\"Extractive Land Sites (Mines', 'Quarries..)\"', NULL, NULL, NULL, 1, '2021-10-24 23:20:28'),
(2823, 'Constructions', 'الابنية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(2824, 'Technical Installations & Industri.tools', 'التجهيزات الفنية  معدات و ادوات صناعية', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(2825, 'Transportation Equipment', 'آليات النقل', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(2826, 'Other Tangible Fixed Assets', 'اصول ثابتة مادية اخرى', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2911, 'Trade Marks and Similars', 'علامات و قيم مماثلة', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2919, 'Other Intangible Fixed Assets', 'اصول ثابتة غير مادية اخرى', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2921, 'Land (Other than extractive Land Sites)', 'الاراضي(غير اراضي برسم الاستثمار الجوفي)', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2926, 'Other Tangible Fixed Assets', 'اصول ثابتة مادية  اخرى', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2951, 'Equity Participations', 'سندات المشاركة', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2952, 'Receivables Related to Equity Participa.', 'ذمم مدينة مرتبطة بمشاركات', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2953, 'Other Blocked Securities', 'سندات اخرى مجمدة', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2955, 'Long and Medium Term Loans', 'قروض  ممنوحة طويلة ومتوسطة الأجل', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(2959, 'Other Blocked Long Term Receivables', 'ذمم مدينة اخرى مجمدة', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(4011, 'Invoices', 'فواتير', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4015, 'Notes Payables', 'اوراق دفع', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4018, 'Invoices not received yet', 'فواتير لم تصل بعد', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4019, 'Earned Discounts & Allowances', 'حسومات  مكتسبة', NULL, NULL, 2, 1, '2021-10-24 23:20:28'),
(4031, 'Invoices', 'فواتير', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4035, 'Notes Payables', 'اوراق دفع', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4038, 'Invoices not received yet', 'فواتير لم تصل بعد', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4039, 'Earned Discounts & Allowances', 'حسومات مكتسبة', NULL, NULL, 2, 1, '2021-10-24 23:20:28'),
(4091, 'Advce Pay. VAT Applied on Acc of operational suplies', 'سلفات ودفعات خاضعة على ح/ طلبيات للأستثمار', NULL, NULL, 2, 1, '2021-10-24 23:20:28'),
(4092, 'Advce Pay. VAT Not Applied on Acc of operational suplies', 'سلفات ودفعات غير خاضعة على ح/ طلبيات للأستثمار', NULL, NULL, 2, 1, '2021-10-24 23:20:28'),
(4111, 'Ordinary Clients', 'زبائن عاديون', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4115, 'Doubtful Clients', 'زبائن مشكوك بتحصيل ديونهم', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4119, 'Discounts & Allowances', 'حسومات ممنوحة من  المؤسسة', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(4191, 'Ad & Pay VAT Applied on Ac for ordrs under execution', 'سلفات ومقبوضات خاضعة على ح/ طلبيات قيد التنفيذ', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(4192, 'Ad & Pay VAT Not applied on Ac for ordrs under execution', 'سلفات ومقبوضات غيرخاضعة على ح/ طلبيات قيد التنفيذ', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(4211, 'Salaries and wages due to Personnel', 'مستحقات رواتب وأجور للمستخدمين والعمّال', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4219, 'Other dues to Personnel', 'مستحقات أخرى متوجّبة للمستخدمين والعمّال', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4281, 'Advances and Payments', 'سلفات ودفعات للمستخدمين', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4282, 'Retentions', 'حجوزات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4311, 'Benefits Payable', 'تقديمات برسم الدفع', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4315, 'Notes Payable - Social Security', 'اوراق الدفع (مؤسسات الضمان الاجتماعي)', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4318, 'Charges tobe accrued for Social Security', 'أعباء يجب لحظها(مؤسسات الضمان الاجتماعي)', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4411, 'Taxes Due  (Operational)', 'ضرائب و رسوم متوجبة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4415, 'Notes Payable  ( Taxes and Rates )', 'اوراق دفع ( ضرائب و رسوم )', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4418, 'Other Taxes to be Accured for', 'اعباء يجب لحظها ( ضرائب و رسوم )', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4421, 'VAT PAID', 'الضريبة على القيمة المضافة المدفوعة ', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(4422, 'VAT REFUNDABLE (ARTICLE 59)', 'الضريبة على القيمة المضافة القابلة للاسترداد (مادة 59)', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(4425, 'BALANCE OF THE VALUE ADDED TAX', 'رصيد الضريبة على القيمة المضافة .', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(4426, 'VAT DEDUCTIBLE', 'الضريبة على القيمة المضافة القابلة للحسم.', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(4427, 'VAT COLLECTED', 'الضريبة على القيمة المضافة المحصلة.', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(4428, 'VAT SUBJECT TO REGULARIZATION', 'الضريبة على القيمة المضافة القابلة للتسوية', NULL, NULL, NULL, 1, '2021-10-24 23:20:28'),
(4429, 'VAT REFUND REQUESTED', 'الضريبة على القيمة المضافة المطلوب إستردادها.', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4431, 'Taxes on Profit', 'الضرائب على الارباح', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4491, 'Subsidies Receivable', 'اعانات مستحقة غير مقبوضة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4497, 'Other Rceivables (Govt & Public Institu)', 'ذمم مدينة اخرى (الدولةوالمؤسسات العامة)', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4498, 'Accrued Revenues Not Collected', 'ايرادات مستحقة غير مقبوضة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4511, 'Affiliated Companies', 'شركات شقيقة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4515, 'Other Partner', 'شركاء آخرون', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4518, 'Joint Ventures', 'عمليات مشتركة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4551, 'Contribution to The Company\'s Capital', 'حسابات المقدمات للشركة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4552, 'Re Imbursement of Company\'s Capital', 'راس المال المقرر استرداده من الشركاء', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4557, 'Other Payables', 'ذمم دائنة اخرى', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4591, 'Subscried & Uncalled Capital', 'راس  المال المكتتب غير المستدعى', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4592, 'Subscribed Capital Called & Unpaid', 'راس المال المكتتب المستدعى غير المدفوع', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4597, 'Other Receivables', 'ذمم مدينة اخرى', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4611, 'Ac.Payable for Consignments & Containers', 'ذمم دائنة متعلقة بمعدات موضوعة بالأمانة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4619, 'Other Payables  ( Opeational )', 'حسابات دائنة مختلفة ( استثمار )', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4631, 'Uncalled Equity Participation', 'سندات مشاركة غير محررة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4633, 'Other Blocked Securities (Uncalled)', 'سندات اخرى مجمدة غير محررة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4651, 'Payables on Aquisition of Sec.Placements', 'ذمم دائنة على امتللاك سندات التوظيف', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4652, 'Debentures', 'سندات الدين', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4653, 'Installments on Aquisition of Sec.Place.', 'اقساط برسم الدفع  على سندات توظيف', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4659, 'Other Miscellaneous Payable NonOperating', 'دائنون مختلفون  ( خارج الاستثمار )', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4681, 'Acc Recei. for Consignmemts & Containers', 'ذمم مدينة متعلقة بالمعدات الواجب اعادتها', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4688, 'Receivable Auxiliary Account', 'حساب وسيط مدين', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4689, 'Other Misc. Receivables Operational', 'حسابات اخرى مدينة مختلفة للأستثمار', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4691, 'Acc Rece.on F.A. Disposal & sale of P.S.', 'ذمم مدينة على بيع اصول ثابتةوسندات توظيف', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4699, 'Other Misc. Receibables Non Operational', 'حسابات اخرى مدينة مختلفة خارج الاستثمار', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4711, 'Pre Operation Expenses', 'اعباء ما قبل الاستثمار', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4712, 'Major Repairs for Amortization', 'التصليحات الكبيرة الواجب استهلاكها', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4713, 'Debenture & Bonds Premiums', 'علاوات تسديد السندات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4719, 'Other Deferred Charges', 'اعباء اخرى واجب توزيعها على عدة دورات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(4968, 'Miscellaneous Receivables - Operational', 'مدينون مختلفون  ( للأستثمار )', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(4969, 'Miscellaneous Receivles -Non Operational', 'مدينون مختلفون  ( خارج الأستثمار )', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(6011, 'Goods', 'البضاعة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6012, 'Purchases Containers & Packing Materials', 'العبوات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6018, 'Expenses Connected to Purchases & Cont.', 'نفقات اضافية على شراء البضائع والعبوات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6019, 'Discount & Allowances Earned', 'حسومات مكتسبة', NULL, NULL, 1, 4, '2021-10-24 23:20:28'),
(6051, 'Opining Stock', 'مخزون اول المدة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6052, 'Closing Stock', 'مخزون آخر المدة', NULL, NULL, 1, 4, '2021-10-24 23:20:28'),
(6111, 'Raw Materials Purchases', 'شراء مواد اولية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6112, 'Consumables Purchases', 'شراء مواد ولوازم استهلاكية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6113, 'Containers & Packing Materials Purchases', 'شراء عبوات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6118, 'Ex.Con.to Raw Mat. & Consumable Purchase', 'مصاريف اضافية على شراء م.اوليةواستهلاكية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6119, 'Discount & Allowances Earned (Detailed)', 'حسومات مكتسبة (بالتفصيل)', NULL, NULL, 1, 4, '2021-10-24 23:20:28'),
(6151, 'Opening Stock', 'مخزون اول المدة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6152, 'Closing Stock', 'مخزون آخر المدة', NULL, NULL, 1, 4, '2021-10-24 23:20:28'),
(6211, 'Sub Contract  A', 'ملتزم ثانوى  أ', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6212, 'Sub Contract  B', 'ملتزم ثانوى  ب', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6219, 'Dis. & Allow.in Pur. from SubContractors', 'حسومات مكتسبةعلى مشتريات من ملتزمين ثانو', NULL, NULL, 1, 4, '2021-10-24 23:20:28'),
(6251, 'Leasing on Materials', 'ايجار -  قرض  اموال منقولة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6252, 'Leasing on Property', 'ايجار -  قرض اموال غير منقولة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6253, 'Royalties', 'حقوق الامتياز', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6254, 'Licences', 'براءات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6255, 'Licences', 'اجازات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6256, 'Trade Marks', 'علامات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6257, 'Know How', 'اساليب', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6258, 'Similar Values & Rights', 'حقوق وقيم مماثلة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6261, 'Transportation & Communication', 'نقليات واتصالات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6262, 'Maintenance & Repairs', 'الصيانة و التصليحات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6263, 'Rent & ( Building Services )', 'الايجارات  ( خدمات الابنية )', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6264, 'Hotels & Restaurants', 'خدمات الفنادق و المطاعم', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6265, 'Personel Services', 'خدمات المستخدمين', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6266, 'Training', 'خدمات تعليمية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6267, 'Studies and Research', 'الدراسات والبحوث', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6268, 'Insurance Premiums', 'اقساط التأمين', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6269, 'Other External Services', 'خدمات خارجية اخرى', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6311, 'Salaries', 'الرواتب', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6312, 'Wages', 'الأجور', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6314, 'Fixed Commission', 'العمولات الثابتة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6316, 'Manager Remunerations (Voting Rights)', 'بدلات مدفوعةلمديرين لهم اغلبية بملكية مؤ', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6317, 'Directors Remuneration', 'البدلات المدفوعة لاعضاء مجلس  الادارة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6511, 'Amortization of Intangible Assets', 'اصول ثابتة غير مادية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6512, 'Depreciation of Fixed Assets', 'اصول ثابتة مادية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6515, 'Amortization of Deffered Charges', 'أعباء للتوزيع على عدة دورات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6551, 'Pro.for dimu.in Value of Intangible F.A.', 'مؤونات هبوط اسعاراصول الثابتة غيرالمادية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6552, 'Prov. for Dimu.in Value of Tangible F.A.', 'مؤونات هبوط اسعار الاصول الثابتة المادية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6553, 'Pro.for Di.in Value of Inv.& Gds.in Pro.', 'مؤونات هبوط اسعار المخزون وقيد الصنع', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6554, 'Provisions for Bad & Doubtful Debts', 'مؤونات هبوط قيم الذمم المدينة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6555, 'Provisions for Risks & Chges.Operational', 'مؤونات لمواجهة مخاطرواعباءعائدةللأستثمار', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6611, 'Attendance Fees', 'بدلات الحضور', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6612, 'Losses on Irrecoverable Operating Recei.', 'خسارة على ذمم استثمار مدينة ثبت هلاكها', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6731, 'Interest Accounts Payable & Loans', 'فوائد على الذمم الدائنة والقروض', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6732, 'Interest Overdrafts & Deposits', 'فوائدعلىالحسابات الجاريةوالودائع الدائنة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6733, 'Interest Guaranteed Debenture & Bonds', 'فوائد السندات المربوطة بكفالات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6734, 'Interest Other Accounts Payable', 'فوائد الذمم الدائنة الاخرى', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6735, 'Discount Paid', 'الخصم الممنوح من المؤسسة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6736, 'Interest Banks & Financial Institutions', 'فوائد مصرفية وفوائد على عمليات التمويل', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6751, 'Normal Operations', 'فروقات على عمليات عادية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6752, 'Capital Operations', 'فروقات على عمليات رأسمالية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6791, 'Amortization of Reinbursement Premiums', 'استهلاك علاوات التسديد', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6792, 'Prov. for Dimu. in Value of Finan. F. A.', 'مؤونات هبوط اسعار الاصول الثابتة المالية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6794, 'Prov.for Dimu.in Value of Sec.Placements', 'مؤونات هبوط اسعار سندات التوظيف', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6795, 'Provision for Risks & Financial Charges', 'مؤونات لمواجهة المخاطر والاعباء المالية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6811, 'Intangible Fixed Assets', 'اصول ثابتة غير مادية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6812, 'Tangible Fixed Assets', 'اصول ثابتة مادية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6815, 'Financial Fixed Assets', 'اصول ثابتة مالية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6851, 'Charges on Administrative Operations', 'اعباء على عمليات  ادارة المؤسسة', NULL, NULL, NULL, NULL, '2021-10-24 23:20:28'),
(6855, 'Charges on Capital Operations', 'اعباء على عمليات  رأسمالية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6891, 'Exceptional Depreciation of Fixed Assets', 'استهلاك استثنائي على اصول ثابتة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6892, 'Pro.for Exceptional Dimunition in Prices', 'مؤونات هبوط اسعار استثنائي', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(6895, 'Pro.for Risks & Charges Non Operational', 'مؤونات لمواجهة مخاطرواعباءخارج الاستثمار', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(7091, 'Discount & Allowances Allowed TX', 'حسومات ممنوحة خاضعة للضريبة', NULL, NULL, 2, 5, '2021-10-24 23:20:28'),
(7092, 'Discount & Allowances Allowed UT', 'حسومات ممنوحة غير خاضعة للضريبة', NULL, NULL, 2, 5, '2021-10-24 23:20:28'),
(7111, 'Sales of Manufactured Goods', 'مبيعات المنتجات التامة الصنع', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7112, 'Sales of By-Products Items', 'مبيعات المنتجات الوسيطة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7113, 'Sales of Scrap', 'مبيعات فضلات الانتاج', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7191, 'Production', 'على بيع المنتجات', NULL, NULL, 2, 5, '2021-10-24 23:20:28'),
(7192, 'Works', 'على بيع الاشغال', NULL, NULL, 2, 5, '2021-10-24 23:20:28'),
(7193, 'Services', 'على بيع الخدمات', NULL, NULL, 2, 5, '2021-10-24 23:20:28'),
(7197, 'Ancillary Activities', 'على بيع نشاطات فرعية', NULL, NULL, 2, 5, '2021-10-24 23:20:28'),
(7211, 'Production in Process', 'منتجات قيد الصنع', NULL, NULL, 3, 5, '2021-10-24 23:20:28'),
(7212, 'Work in Progress', 'اشغال قيد التنفيذ', NULL, NULL, 3, 5, '2021-10-24 23:20:28'),
(7225, 'Studies in Progress', 'دراسات قيد الاعداد', NULL, NULL, 3, 5, '2021-10-24 23:20:28'),
(7226, 'Services in Progress', 'خدمات قيد التنفيذ', NULL, NULL, 3, 5, '2021-10-24 23:20:28'),
(7251, 'By Products Items', 'منتجات وسيطة', NULL, NULL, 3, 5, '2021-10-24 23:20:28'),
(7255, 'Manufactured Goods', 'منتجات تامة الصنع', NULL, NULL, 3, 5, '2021-10-24 23:20:28'),
(7258, 'Scrap', 'فضلات الانتاج', NULL, NULL, 3, 5, '2021-10-24 23:20:28'),
(7611, '\"Royalties Patients Licences Trade Marks', '\"', NULL, NULL, NULL, 1, '2021-10-24 23:20:28'),
(7612, 'Rent Income', 'ايرادات الابنية غيرالمخصصة للنشاط المهني', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7613, 'Director\'s Attendance Fees & Allowances', '\"بدلات حضور وتعويضات أ.م.الادارة', NULL, NULL, NULL, 1, '2021-10-24 23:20:28'),
(7619, 'Allocation of Operating Expenses', 'اعباء استثمار محولة الى حسابات اخرى', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7651, 'Net Transfers of Allocated Charges', 'حصص  الاعباء الصافية التي جرى تحويلها(.)', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7655, 'Net Attributions of Income', 'حصص  الايرادات الصافية المقررة ( . )', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7711, 'Dividends', 'عائدات سندات المشاركة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7716, 'Revenue from Other Equity Participations', 'عائدات المشاركات  الاخرى', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7717, 'Rev.from Rebles Reted to Equity Particip', 'عائدات الذمم المدينة المرتبطة بمشاركات', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7721, 'Revenue from Securities Placements', 'عائدات سندات التوظيف', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7723, 'Rvenue from Blocked Securities', 'عائدات السندات المجمدة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7725, 'Revenue from Blocked Receivable', 'عائدات الذمم المدينة المجمدة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7726, 'Revenue from Commercial Receivables', 'عائدات الذمم المدينة التجارية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7727, 'Revenue from Miscelaneous Receibables', 'عائدات الذمم المدينة المختلفة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7731, 'Revenue on Loans Granted', 'عائدات القروض  الممنوحة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7733, 'Earned Discount & Allowances', 'الخصم الممنوح للمؤسسة', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7751, 'Current Operations', 'على عمليات جارية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7755, 'Capital Operations', 'على عمليات رأسمالية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7781, 'Net Income on Sale of Security Placement', 'ايرادات صافية على بيع سندات توظيف', NULL, NULL, 1, 5, '2021-10-24 23:20:28');
INSERT INTO `chart_of_accounts` (`ledger_id`, `ledger_name_en`, `ledger_name_ar`, `description_ar`, `description_en`, `account_status_id`, `account_position_id`, `date_created`) VALUES
(7789, 'Allocation of Financial Charges', 'اعباء مالية محولة الى حسابات اخرى', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7793, 'W-B of Provisions for dimunit. of Values', 'استردادات من مؤونات هبوط الاسعار', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7795, 'W-B of Provisions for Risks & Charges', 'استردادات من مؤونات المخاطر والأعباء', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7811, 'Intangible Fixed Assets', 'اصول ثابتة غير مادية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7812, 'Tangible Fixed Assets', 'اصول ثابتة مادية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7815, 'Financial Fixed Assets', 'اصول ثابتة مالية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7881, 'Exceptional Revenue on OrdinaryOperation', 'ايرادات استثنائية على عمليات عادية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7888, 'Other Revenue on Exce.Capital Operations', 'ايرادات اخرىعلى عمليات رأسماليةاستثنائية', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7889, 'Allocation of Exceptional Charges', 'اعباء استثنائية محولة الى حسابات اخرى', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7891, 'W-B of Provision for Dimunition in Value', 'استردادات من مؤونات هبوط الاسعار', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(7895, 'W-B of Provision of risks & Charges', 'استردادات من مؤونات المخاطر و الأعباء', NULL, NULL, 1, 5, '2021-10-24 23:20:28'),
(28211, 'Naked Land', 'الاراضي الفراغ', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28212, 'Built Lands (Real Estate Complexes)', 'الاراضي المبنية', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28213, 'Extractive Land Sites (Mines & Quarris)', 'الاراضي برسم الاستثمارالجوفي مناجم مقالع', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28214, 'Land Development and Reclamation', 'استصلاح وتنظيم الاراضي', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28231, 'Buildings', 'الأبنية', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28232, 'Ge.Installation & Leasehold Improvements', 'التجهيزات العامة استصلاح وتنظيم ابنية', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28233, 'Infrastructure Works (Dams Airp.Runways)', 'انشاءات البنية التحتية سدود مدارج مطارات', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28234, 'Construction on Leasehold Land', 'انشاءات على اراضي الغير', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28241, 'Specialized Installations', 'تجهيزات متخصصة', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28242, 'Specific Installations', 'تجهيزات ذات طبيعة خاصة', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28243, 'Industrial Equipment', 'المعدات الصناعية', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28244, 'Industrial Tools', 'الأدوات الصناعية', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28251, 'Transportation Equipment', 'آليات النقل', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28252, 'Materiel de transport', 'آليات النقل سياحية', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28261, 'Gn. Inst. & Other Improvements & Dvlpmnt', 'تجهيزات عامة استصلاحات وتحسينات مختلفة', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28262, 'Office and Computer Equipment', 'ادوات مكتبية و معلوماتية', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28263, 'Furniture', 'أثاث', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28264, 'Agricultural Investments', 'استثمارات زراعية', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(28265, 'Reusable Packing Material', 'عبوات قابلة لأعادة الأستعمال', NULL, NULL, 1, 2, '2021-10-24 23:20:28'),
(44210, 'VAT paid on purchases used only for processes that allow the right of deduction', 'الضريبة على القيمة المضافة المدفوعة على المشتريات المستعملة فقط لعمليات تتيح حق الحسم', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44211, 'VAT paid on purchases used only for processes that allow the right of refund', 'الضريبة على القيمة المضافة المدفوعة على المشتريات المستعملة فقط لعمليات تتيح حق الاسترداد', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44212, 'VAT paid on purchases wich can not determine its point of usage', 'الضريبة على القيمة المضافة المدفوعة على المشتريات التي لا يمكن تحديد وجة استعمالها', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44213, 'VAT paid on acquisition of fixed assets used only for processes that allow the right of deduction', 'الضريبة على القيمة المضافة المدفوعة على مشتريات الاصول الثابتة المستعملة فقط لعمليات تتيح حق الحسم', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44214, 'VAT paid on acquisition of fixed assets used only for processes that allow the right of refund', 'الضريبة على القيمة المضافة المدفوعة على مشتريات الأصول الثابتة المستعملة فقط لعمليات تتيح حق الاسترداد', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44215, 'VAT paid on acquisition wich can not determine its point of usage', 'الضريبة على القيمة المضافة المدفوعة على  الاصول الثابتة التي لا يمكن تحديد وجة استعمالها', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44216, 'VAT paid on expenses used only for processes that allow the right of deduction', 'الضريبة على القيمة المضافة المدفوعة على  الاعباء المستعملة فقط لعمليات تتيح حق الحسم', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44217, 'VAT paid on expenses used only for processes that allow the right of refund', 'الضريبة على القيمة المضافة المدفوعة على الأعباء المستعملة فقط لعمليات تتيح حق الاسترداد', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44218, 'VAT paid on expenses wich can not determine its point of usage', 'الضريبة على القيمة المضافة المدفوعة على  الاعباء التي لايمكن تحديد وجهة استعمالها', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44219, 'VAT paid on advances & payments on account of investment order', 'الضريبة على القيمة المضافة المدفوعة على السلفات والدفعات على حساب طلبيات للاستثمار', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44221, 'VAT refundable (Atricle 59) on purchases', 'الضريبة على القيمة المضافة القابلة للاسترداد(مادة 59)على المشتريات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44222, 'VAT partially refundable (Atricle 59) on purchases', 'الضريبة على القيمة المضافة القابلة للاسترداد الجزئي(مادة 59)على المشتريات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44223, 'VAT refundable (Atricle 59) acquisition of fixed assets', 'الضريبة على القيمة المضافة القابلة للاسترداد(مادة 59) مشتريات الأصول الثابتة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44224, 'VAT partially refundable (Atricle 59) acquisition of fixed assets', 'الضريبة على القيمة المضافة القابلة للاسترداد الجزئي(مادة 59)على مشتريات الأصول الثابتة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44225, 'VAT refundable (Atricle 59) on expenses', 'الضريبة على القيمة المضافة القابلة للاسترداد(مادة 59) على الاعباء', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44226, 'VAT partially refundable (Atricle 59) on expenses', 'الضريبة على القيمة المضافة القابلة للاسترداد الجزئي(مادة 59)على الأعباء', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44251, 'VAT due for payment', 'الضريبة على القيمة المضافة .المستحقة للدفع.', NULL, NULL, 3, 2, '2021-10-24 23:20:28'),
(44252, 'VAT reported and refundable', 'الضريبة على القيمة المضافة المدورة القابلة للاسترداد.', NULL, NULL, 3, 2, '2021-10-24 23:20:28'),
(44261, 'VAT deductible on purchases', 'الضريبة على القيمة المضافة القابلة للحسم على المشتريات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44262, 'VAT partially deductible on purchases', 'الضريبة على القيمة المضافة القابلة للحسم الجزئي على المشتريات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44263, 'VAT deductible on purchases of fixed assets', 'الضريبة على القيمة المضافة القابلة للحسم على مشتريات الأصول الثابتة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44264, 'VAT partially deductible on purchases of fixed assets', 'الضريبة على القيمة المضافة القابلة للحسم الجزئي على مشتريات الأصول الثابتة ', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44265, 'VAT deductible on expenses', 'الضريبة على القيمة المضافة القابلة للحسم على الاعباء', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44266, 'VAT partially deductible on expenses', 'الضريبة على القيمة المضافة القابلة للحسم الجزئي على الأعباء', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44267, 'VAT deductible on advances & payments on account of investment order', 'الضريبة على القيمة المضافة القابلة للحسم على السلفات والدفعات على حساب طلبيات للاستثمار', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44268, 'VAT partially deductible on advances & payments on account of investment order', 'الضريبة على القيمة المضافة القابلة للحسم الجزئي على السلفات والدفعات على حساب طلبيات للاستثمار', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(44270, 'VAT collected on deliveries of funds', 'الضريبة على القيمة المضافة المحصلة على عمليات تسليم الأموال', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44271, 'VAT collected on the delivery of services', 'الضريبة على القيمة المضافة المحصلة على عمليات تقديم الخدمات', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44272, 'VAT collected on deliveries of funds based on the cash register', 'الضريبة على القيمة المضافة المحصلة على عمليات تسليم الأموال على الأسس النقدية', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44273, 'VAT collected on the delivery of services based on the cash register', 'الضريبة على القيمة المضافة المحصلة على عمليات تقديم الخدمات على الأسس النقدية', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44274, '\"VAT collected on jewelry delivery of wich the tax is calculated on the basis of \"\"Gross Profiy Margin\"\"\"', 'الضريبة على القيمة المضافة المحصلة على عمليات تسليم المجوهرات المحتسبة ضريبتها على أساس هامش الربح الإجمالي', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44275, 'VAT collected on deliveries of funds for tourists', 'الضريبة على القيمة المضافة المحصلة على عمليات تسليم الأموال للسياح', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44276, 'VAT collected on deliveries of funds and providing services on the behalf of the operator', 'الضريبة على القيمة المضافة المحصلة على عمليات تسليم الأموال وتقديم الخدمات للذات', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44277, 'VAT collected on amounts dues to the non-residents', 'الضريبة على القيمة المضافة المحصلة على عمليات تسليم الأموال على الاسس النقدية مبالغ مستحقة لغير المقيمين', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44278, 'VAT collected on disposal of fixed assets', 'الضريبة على القيمة المضافة المحصلة على مبيع أصول ثابتة ', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44279, 'VAT collected on advances & receipts of the orders in progress', 'الضريبة على القيمة المضافة المحصلة على السلفات والمقبوضات على حساب طلبيات قيد التنفيذ', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44281, 'VAT subject to debtor regularization', 'الضريبة على القيمة المضافة القابلة للتسوية المدينة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44282, 'VAT subject to creditor regularization', 'الضريبة على القيمة المضافة القابلة للتسوية الدائنة', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44291, 'VAT refund requested (Quarterly Refund)', 'الضريبة على القيمة المضافة المطلوب إستردادها -استرداد فصلي', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44292, 'VAT refund requested (Semesterly Refund)', 'الضريبة على القيمة المضافة المطلوب إستردادها -استرداد نصف سنوي', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44293, 'VAT refund requested (Yearly Refund)', 'الضريبة على القيمة المضافة المطلوب إستردادها -استرداد سنوي', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(44294, 'VAT refund requested (artcile 59)', 'الضريبة على القيمة المضافة المطلوب إستردادها -مادة 59', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(45111, 'Holding Company', 'الشركة الأم', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(45112, 'Subsidiary Companies', 'الشركات التابعة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(45113, 'Affiliated Companies', 'الشركات المشاركة', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(45114, 'Multi Group Companies', 'الشركات الداخلة في عدة مجموعات', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(60181, 'Freight', 'نقليات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(60182, 'Commissions', 'سمسرة و عمولات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(60183, 'Insurance on Freight', 'تأمين على الشحن', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(60184, 'Clearing Expenses', 'اتعاب مخلصي البضاعة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(60185, 'Customs Charges', 'رسوم جمركية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(60191, 'Discount & Allowances Earned-Taxable', 'حسومات مكتسبة خاضعة للضريبة', NULL, NULL, 1, 4, '2021-10-24 23:20:28'),
(60192, 'Discount & Allowances Earned-Un-Taxable', 'حسومات مكتسبة غير خاضعة للضريبة', NULL, NULL, 1, 4, '2021-10-24 23:20:28'),
(61111, 'A. Raw Materials Purchases', 'مواد اولية  أ', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61112, 'B. Raw Materials Purchases', 'مواد اولية  ب', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61121, 'Fuel and Gaz', 'محروقات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61122, 'Maintenance Products', 'مواد الصيانة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61123, 'Workshop and Factory Supplies', 'لوازم للمشغل و المصنع', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61124, 'Stores Supplies', 'لوازم للمخزن', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61125, 'Office Supplies', 'لوازم مكتبية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61131, 'Unreturnable Containers', 'عبوات لا تسترد', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61132, 'Returnable Containers', 'عبوات تسترد ويعاد استعمالها', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61133, 'Other Containers', 'عبوات تستعمل على أوجه مختلفة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61181, 'Transport and Freight', 'نقليات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61182, 'Commissions and Brokerage', 'سمسرة وعمولات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61183, 'Insurance on Freight', 'تأمين على الشحن', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61184, 'Clearing Charges', 'اتعاب مخلصي البضاعة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(61185, 'Customs Charges', 'رسوم جمركية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62611, 'Transportation of Assets', 'نفقات النقل للموجودات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62612, 'Personnel Collective Transportation', 'نفقات النقل المشترك للمستخدمين', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62615, 'Postage Telephone & Telecommunications', 'نفقات البريد والاتصالات السلكية ولاسلكية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62631, 'Rent', 'الايجارات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62632, 'Other Related Charges', 'اعباء تأجيرية اخرى', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62641, 'Entertainment', 'تشريفات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62642, 'Travel & Transport', 'نقل وانتقال', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62643, 'Personel Meals', 'اطعام المستخدمين', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62651, 'Temperory Personnel', 'المستخدمون المؤقتون', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62652, 'Agent\'s Commission', 'اجور الوسطاء', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62653, 'Fees', 'بدلات اتعاب', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62661, 'Training & Development', 'الاعداد والتدريب', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62662, 'Documentations', 'التوثيق', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62691, 'Medical Care', 'خدمات صحية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(62692, 'Financial Fees & Expenses on Sec.& notes', 'خدمات مالية.مصاريف علىسندات واوراق مالية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(68511, 'Donations', 'هبــات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(68512, 'Subsidies Granted', 'اعانات ممنوحة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(68513, 'Fines & Penalties', 'غرامات ضريبية وجزائية', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(68514, 'Penalties on Contracts', 'غرامات على صفقات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(68515, 'Irrecoverable Receivables', 'ذمم مدينة اصبحت هالكة', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(68516, 'Other Administrative Operations', 'عمليات ادارية اخرى', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(68551, 'Price Indexing', 'اعباء ناتجة عن موجب تطبيق مؤشر اسعار', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(68552, 'Reinbursement Allowances', 'جوائز تسديد', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(68553, 'Purcha.of the Company Own Shares & Notes', 'اعباءناتجة عن استردادالمؤسسةلأسهم وسندات', NULL, NULL, 2, 4, '2021-10-24 23:20:28'),
(442121, 'VAT paid on purchases wich can not determine its point of usage (partial deduction)', 'الضريبة على القيمة المضافة المدفوعة على المشتريات التي لا يمكن تحديد وجة استعمالها (استرداد جزئي)', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(442122, 'VAT paid on purchases wich can not determine its point of usage (partial refund)', 'الضريبة على القيمة المضافة المدفوعة على المشتريات التي لا يمكن تحديد وجة استعمالها (حسم جزئي)', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(442123, 'VAT paid on purchases wich can not determine its point of usage', 'الضريبة على القيمة المضافة المدفوعة على المشتريات التي لا يمكن تحديد وجة استعمالها', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(442151, 'VAT paid on acquisition wich can not determine its point of usage (partial deduction)', 'الضريبة على القيمة المضافة المدفوعة على  الاصول الثابتة التي لا يمكن تحديد وجة استعمالها (استرداد جزئي)', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(442152, 'VAT paid on acquisition wich can not determine its point of usage (partial refund)', 'الضريبة على القيمة المضافة المدفوعة على  الاصول الثابتة التي لا يمكن تحديد وجة استعمالها (حسم جزئي)', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(442153, 'VAT paid on acquisition wich can not determine its point of usage', 'الضريبة على القيمة المضافة المدفوعة على  الاصول الثابتة التي لا يمكن تحديد وجة استعمالها', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(442181, 'VAT paid on expenses wich can not determine its point of usage (partial deduction)', 'الضريبة على القيمة المضافة المدفوعة على  الاعباء التي لايمكن تحديد وجهة استعمالها (استرداد جزئي)', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(442182, 'VAT paid on expenses wich can not determine its point of usage (partial refund)', 'الضريبة على القيمة المضافة المدفوعة على  الاعباء التي لايمكن تحديد وجهة استعمالها (حسم جزئي)', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(442183, 'VAT paid on expenses wich can not determine its point of usage', 'الضريبة على القيمة المضافة المدفوعة على  الاعباء التي لايمكن تحديد وجهة استعمالها', NULL, NULL, 2, 2, '2021-10-24 23:20:28'),
(442811, 'VAT subject to debtor regularization on advance', 'الضريبة على القيمة المضافة القابلة للتسوية المدينة على السلفات', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(442812, 'VAT subject to debtor regularization on other accounts', 'الضريبة على القيمة المضافة القابلة للتسوية المدينة على الحسابات الاخرى', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(442821, 'VAT subject to creditor regularization on advance', 'الضريبة على القيمة المضافة القابلة للتسوية الدائنة على السلفات', NULL, NULL, 1, 1, '2021-10-24 23:20:28'),
(442822, 'VAT subject to creditor regularization on other accounts', 'الضريبة على القيمة المضافة القابلة للتسوية الدائنة على الحسابات الاخرى', NULL, NULL, 1, 1, '2021-10-24 23:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets`
--

CREATE TABLE `fixed_assets` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `fa_location` text DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `cost` float NOT NULL,
  `acquisition_date` date NOT NULL,
  `sub_category` int(11) NOT NULL,
  `fa_group` int(11) DEFAULT NULL,
  `active` int(1) NOT NULL DEFAULT 1,
  `depreciates_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fixed_assets`
--

INSERT INTO `fixed_assets` (`id`, `title`, `fa_location`, `description`, `cost`, `acquisition_date`, `sub_category`, `fa_group`, `active`, `depreciates_on`) VALUES
(1, 'HDMI 3.0', NULL, 'Update test description', 6, '2021-09-11', 2, 2, 1, '2021-09-30'),
(2, 'Lenovo Screen', 'test location', NULL, 301, '2021-09-01', 2, 2, 1, '2021-12-30'),
(5, 'test', '', '', 42, '2021-10-15', 1, 2, 1, '2021-10-14'),
(8, 'test', '', '', 23, '2021-10-26', 1, 1, 1, '2021-10-29'),
(9, 'tester', '', '', 44, '2021-10-26', 2, 1, 1, '2021-10-23');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets_accounts`
--

CREATE TABLE `fixed_assets_accounts` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fixed_assets_accounts`
--

INSERT INTO `fixed_assets_accounts` (`id`, `asset_id`, `account_id`, `start_date`, `end_date`) VALUES
(4, 9, 40, '2021-10-26 11:06:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets_category`
--

CREATE TABLE `fixed_assets_category` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fixed_assets_category`
--

INSERT INTO `fixed_assets_category` (`id`, `title`) VALUES
(1, 'IT Supplies'),
(2, 'Office Supplies');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets_depreciation`
--

CREATE TABLE `fixed_assets_depreciation` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `current_amount` float NOT NULL,
  `depreciation_amount` float NOT NULL,
  `depreciation_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fixed_assets_depreciation`
--

INSERT INTO `fixed_assets_depreciation` (`id`, `asset_id`, `current_amount`, `depreciation_amount`, `depreciation_date`) VALUES
(1, 1, 25, 0, '0000-00-00'),
(2, 2, 300, 0, '0000-00-00'),
(3, 1, 0, 0, '2021-10-12'),
(4, 1, 0, 0, '2021-10-12'),
(5, 1, 0, 0, '2021-10-12'),
(6, 1, 0, 0, '2021-10-12'),
(7, 1, 0, 0, '2021-10-12'),
(8, 1, 0, 0, '2021-10-12'),
(9, 1, 0, 0, '2021-10-12'),
(10, 1, 0, 44, '2021-10-12'),
(11, 1, 0, 44, '2021-10-12'),
(12, 1, 0, 0, '2021-10-12'),
(13, 1, 0, 0, '2021-10-12'),
(14, 1, 0, 0, '2021-10-12'),
(15, 1, 0, 44, '2021-10-12'),
(16, 1, 32, 12, '2021-10-12'),
(17, 1, 20, 12, '2021-10-12'),
(18, 1, 9, 11, '2021-10-12'),
(19, 1, 6, 3, '2021-10-12');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets_group`
--

CREATE TABLE `fixed_assets_group` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fixed_assets_group`
--

INSERT INTO `fixed_assets_group` (`id`, `title`, `description`) VALUES
(1, 'Assets for Office', ''),
(2, 'Assets for Data Center', ''),
(3, 'test Group', '');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_assets_subcategory`
--

CREATE TABLE `fixed_assets_subcategory` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fixed_assets_subcategory`
--

INSERT INTO `fixed_assets_subcategory` (`id`, `category_id`, `title`) VALUES
(1, 1, 'HDMI Cables'),
(2, 1, 'Monitors'),
(3, 1, 'Ethernet Cables');

-- --------------------------------------------------------

--
-- Table structure for table `journal_entry_operations`
--

CREATE TABLE `journal_entry_operations` (
  `id` int(11) NOT NULL,
  `operation_type_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journal_entry_operations`
--

INSERT INTO `journal_entry_operations` (`id`, `operation_type_id`, `account_id`, `amount`, `date_created`) VALUES
(87, 2, 0, 41, '2021-10-28 13:28:04'),
(88, 2, 0, 41, '2021-10-28 13:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `journal_entry_operation_types`
--

CREATE TABLE `journal_entry_operation_types` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journal_entry_operation_types`
--

INSERT INTO `journal_entry_operation_types` (`id`, `type`, `description`, `date_created`) VALUES
(1, 'credit', 'credit operation', '2021-08-23 16:10:58'),
(2, 'debit', 'debit operation', '2021-08-23 16:10:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_account_position` (`position_id`),
  ADD KEY `accounts_account_status` (`status_id`),
  ADD KEY `accounts_ledger_id` (`chart_of_accounts_id`),
  ADD KEY `accounts_reference_type` (`reference_type_id`);

--
-- Indexes for table `account_positions`
--
ALTER TABLE `account_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_reference_types`
--
ALTER TABLE `account_reference_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_statuses`
--
ALTER TABLE `account_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`ledger_id`),
  ADD KEY `coa_account_position` (`account_position_id`),
  ADD KEY `coa_account_status` (`account_status_id`);

--
-- Indexes for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_group` (`fa_group`),
  ADD KEY `asset_subcategory` (`sub_category`);

--
-- Indexes for table `fixed_assets_accounts`
--
ALTER TABLE `fixed_assets_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_account` (`asset_id`),
  ADD KEY `account_number` (`account_id`);

--
-- Indexes for table `fixed_assets_category`
--
ALTER TABLE `fixed_assets_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixed_assets_depreciation`
--
ALTER TABLE `fixed_assets_depreciation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `asset_depreciation` (`asset_id`);

--
-- Indexes for table `fixed_assets_group`
--
ALTER TABLE `fixed_assets_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixed_assets_subcategory`
--
ALTER TABLE `fixed_assets_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fixed_assets_subcategory_category_id_fixed_assets_category_id` (`category_id`);

--
-- Indexes for table `journal_entry_operations`
--
ALTER TABLE `journal_entry_operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `journal_entry_operations_type` (`operation_type_id`),
  ADD KEY `journal_entry_operations_account_id` (`account_id`);

--
-- Indexes for table `journal_entry_operation_types`
--
ALTER TABLE `journal_entry_operation_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `account_positions`
--
ALTER TABLE `account_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_reference_types`
--
ALTER TABLE `account_reference_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_statuses`
--
ALTER TABLE `account_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `fixed_assets_accounts`
--
ALTER TABLE `fixed_assets_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fixed_assets_category`
--
ALTER TABLE `fixed_assets_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fixed_assets_depreciation`
--
ALTER TABLE `fixed_assets_depreciation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `fixed_assets_group`
--
ALTER TABLE `fixed_assets_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fixed_assets_subcategory`
--
ALTER TABLE `fixed_assets_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `journal_entry_operations`
--
ALTER TABLE `journal_entry_operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `journal_entry_operation_types`
--
ALTER TABLE `journal_entry_operation_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fixed_assets`
--
ALTER TABLE `fixed_assets`
  ADD CONSTRAINT `asset_group` FOREIGN KEY (`fa_group`) REFERENCES `fixed_assets_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asset_subcategory` FOREIGN KEY (`sub_category`) REFERENCES `fixed_assets_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fixed_assets_accounts`
--
ALTER TABLE `fixed_assets_accounts`
  ADD CONSTRAINT `account_number` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `asset_account` FOREIGN KEY (`asset_id`) REFERENCES `fixed_assets` (`id`);

--
-- Constraints for table `fixed_assets_depreciation`
--
ALTER TABLE `fixed_assets_depreciation`
  ADD CONSTRAINT `asset_depreciation` FOREIGN KEY (`asset_id`) REFERENCES `fixed_assets` (`id`);

--
-- Constraints for table `fixed_assets_subcategory`
--
ALTER TABLE `fixed_assets_subcategory`
  ADD CONSTRAINT `fixed_assets_subcategory_category_id_fixed_assets_category_id` FOREIGN KEY (`category_id`) REFERENCES `fixed_assets_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
